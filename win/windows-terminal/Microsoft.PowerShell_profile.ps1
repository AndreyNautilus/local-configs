Import-Module posh-git

oh-my-posh init pwsh --config "$HOME\Documents\PowerShell\andrey-nautilus.omp.json" | Invoke-Expression

# enable bash-like TAB-completion
# arrow up/down search in history for completion
# See: https://stackoverflow.com/questions/8264655/how-to-make-powershell-tab-completion-work-like-bash
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
