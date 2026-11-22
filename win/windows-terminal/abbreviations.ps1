#requires -Version 5.1

<#
.SYNOPSIS
Expands command-line abbreviations on Space and Enter in PSReadLine.

.DESCRIPTION
Only the first word in the buffer is eligible for expansion. Space expands it
when the cursor is immediately after the word. Enter expands it and submits
the line through PSReadLine.

.PARAMETER AbbreviationsPath
Directory containing the abbreviation definitions. Each .psd1 file contains
a hashtable mapping a short name to its replacement text. Files load in
filename order. For duplicate names, the last definition wins. Names are
case-insensitive and may contain letters, digits, underscores, and hyphens.
The first character must be a letter or an underscore.

.EXAMPLE
& abbreviations.ps1

.EXAMPLE
& abbreviations.ps1 -AbbreviationsPath "$HOME\path\to\abbreviations.d"
#>
[CmdletBinding()]
param(
    [ValidateNotNullOrEmpty()]
    [string]$AbbreviationsPath = (Join-Path $PSScriptRoot 'abbreviations.d')
)

$directory = Get-Item -LiteralPath $AbbreviationsPath -Force -ErrorAction Stop
if ($directory -isnot [System.IO.DirectoryInfo]) {
    throw "AbbreviationsPath must be a filesystem directory. Received '$AbbreviationsPath'."
}

$namePattern = '[\p{L}_][\w-]*'
$abbreviations = @{}
$definitionFiles = Get-ChildItem -LiteralPath $directory.FullName -Filter '*.psd1' -File -Force -ErrorAction Stop |
    Sort-Object -Property Name

foreach ($file in $definitionFiles) {
    $definitions = Import-PowerShellDataFile -LiteralPath $file.FullName -ErrorAction Stop
    foreach ($entry in $definitions.GetEnumerator()) {
        if ($entry.Key -isnot [string] -or $entry.Key -notmatch "\A$namePattern\z") {
            throw "Invalid abbreviation name '$($entry.Key)' in '$($file.FullName)'."
        }
        if ($entry.Value -isnot [string] -or [string]::IsNullOrWhiteSpace($entry.Value)) {
            throw "Abbreviation '$($entry.Key)' in '$($file.FullName)' must have a nonempty string replacement."
        }
        $abbreviations[$entry.Key] = $entry.Value
    }
}

Import-Module PSReadLine -MinimumVersion 2.0.0 -Global -ErrorAction Stop

$firstWord = [regex]"\A\s*(?<Name>$namePattern)(?=\s|\z)"
$expandAbbreviation = {
    param($key, $arg)

    $onEnter = $key.Key -eq [ConsoleKey]::Enter
    $line = ''
    $cursor = 0
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    $name = $firstWord.Match($line).Groups['Name']

    if ($name.Success -and $abbreviations.ContainsKey($name.Value)) {
        $replacement = $abbreviations[$name.Value]
        if ($onEnter) {
            [Microsoft.PowerShell.PSConsoleReadLine]::Replace($name.Index, $name.Length, $replacement)
        } elseif ($cursor -eq ($name.Index + $name.Length)) {
            $selectionStart = 0
            $selectionLength = 0
            [Microsoft.PowerShell.PSConsoleReadLine]::GetSelectionState([ref]$selectionStart, [ref]$selectionLength)
            if ($selectionStart -eq -1) {
                # A single edit lets Undo restore the abbreviation in one step.
                [Microsoft.PowerShell.PSConsoleReadLine]::Replace($name.Index, $name.Length, $replacement + ' ')
                return
            }
        }
    }

    if ($onEnter) {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine($key, $arg)
    } else {
        [Microsoft.PowerShell.PSConsoleReadLine]::SelfInsert($key, $arg)
    }
}.GetNewClosure()

$handler = @{
    BriefDescription = 'ExpandAbbreviation'
    Description = 'Expand the first command word, then insert Space or accept the line.'
    ScriptBlock = $expandAbbreviation
    ErrorAction = 'Stop'
}
Set-PSReadLineKeyHandler -Chord Spacebar, Enter @handler
if ((Get-PSReadLineOption).EditMode -eq 'Vi') {
    Set-PSReadLineKeyHandler -Chord Enter -ViMode Command @handler
}
