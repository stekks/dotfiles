#$env:POSH_GIT_ENABLED = $true
# oh-my-posh --init --shell pwsh --config ~/AppData/Local/oh-my-posh/powerlevel10k_classic.omp.json | Invoke-Expression
Import-Module posh-git
Import-Module z
Invoke-Expression (&starship init powershell)

# Aliasses
New-Alias which get-command
New-Alias lg lazygit

function fp()
{
  fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

# PSReadline settings
#Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineKeyHandler -Key Tab -Function Complete

# (Ps)FZF: replace 'Ctrl+t' and 'Ctrl+r' with PsFZF 
Remove-PSReadlineKeyHandler 'Ctrl+r'
Remove-PSReadlineKeyHandler 'Ctrl+t'

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$env:FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
$env:FZF_DEFAULT_OPTS="--layout=reverse --inline-info --ansi --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle"

cd \Code
