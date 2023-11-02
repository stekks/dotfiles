Invoke-Expression (&starship init powershell)
Import-Module PowerColorLS

# Aliasses
New-Alias which get-command
New-Alias lg lazygit
Set-Alias -Name ls -Value PowerColorLS -Option AllScope

# default nvim is nvim-lazy
$env:NVIM_APPNAME="nvim-lazy"

function ll()
{
    PowerColorLs -a -l
}

function fp()
{
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

function lv()
{
    $env:NVIM_APPNAME="nvim-lazy"
    nvim $args
}

function jv()
{
    $env:NVIM_APPNAME="nvim-jan"
    nvim $args
}

function cv()
{
    $env:NVIM_APPNAME="nvim-nvchad"
    nvim $args
}

function av()
{
    $env:NVIM_APPNAME="nvim-astro"
    nvim $args
}

function spv()
{
    $env:NVIM_APPNAME="nvim-space"
    nvim $args
}

function minv()
{
    $env:NVIM_APPNAME="nvim-min"
    nvim $args
}

# neovim config selector
function ns()
{
    $items = "default", "nvim-lazy", "nvim-astro", "nvim-jan", "nvim-nvchad", "nvim-space", "nvim-min"
    $config = $items | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0

    if ([string]::IsNullOrEmpty($config))
    {
        Write-Output "Nothing config"
        break
    }
 
    if ($config -eq "default")
    {
        $config = ""
    }

    $env:NVIM_APPNAME=$config
    nvim $args 
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

Set-Location \Code

Set-Alias lvim 'C:\Users\jbroeze\.local\bin\lvim.ps1'


