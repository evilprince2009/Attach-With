function Remove-With()
{
    param(
        [string]
        $command
    )

    $splitted = $command -split ' '
    if (!($splitted.Length -eq 1))
    {
        $splitted = $splitted[0..($splitted.Length - 2)]
    }    
    return "$splitted"
}

function Move-With()
{
    param(
        [string]
        $command
    )

    while($true)
    {
        Write-Host  ''
        Write-WithPrompt -command $command
        
        $input_shell = (Read-Host -WarningAction SilentlyContinue)
        
        if ($input_shell.ToLower() -eq 'quit' -or $input_shell.ToLower() -eq 'q')
        {
            return
        }
        elseif ($input_shell.StartsWith(':'))
        {
            if ($input_shell.Length -eq 1)
            {
                continue
            }
            Invoke-Expression "$($input_shell.Substring(1))"
        }
        elseif ($input_shell.StartsWith($command)) {
            
            Write-Host "  Your primary command is '$command'." -ForegroundColor DarkRed
            Write-Host "  When using with, make sure to not duplicate the command." -ForegroundColor DarkRed
        }
        elseif ($input_shell.StartsWith('>'))
        {
            $addition = $input_shell.Substring(1).Trim()
            if (!($addition -eq ''))
            {
                $command += " $($input_shell.Substring(1).Trim())"
            }
        }
        elseif ($input_shell.StartsWith('<'))
        {
            $command = Remove-With -command $command
        }
        else 
        {
            Invoke-Expression "$command $input_shell"
        }
        
    }
}

function global:Write-WithPrompt()
{
    param(
        [string]
        $command
    )

    Write-ClassicPrompt -command $command
}

function Write-ClassicPrompt()
{
    param(
        [string]
        $command
    )
    
    $colors = @(
        'DarkGreen'
        'DarkCyan'
        'DarkRed'
        'DarkMagenta'
        'DarkYellow'
        'Green'
        'Cyan'
        'Red'
        'Magenta'
        'Yellow'
        'White'
    )
    
    $random_index_ps = Get-Random -Minimum 0 -Maximum ($colors.Count - 1)
    $random_index_command = Get-Random -Minimum 0 -Maximum ($colors.Count - 1)
    $random_color_command = $colors[$random_index_command]
    $random_color_shell = $colors[$random_index_ps]

    Write-Host " PS $pwd " -ForegroundColor $random_color_shell -NoNewline
    Write-Host "$($command)" -ForegroundColor $random_color_command -NoNewline
    Write-Host "  " -NoNewline    
}

function Invoke-With()
{
    $command = $args
    if (Validate-Command -command $command[0])
    {
        Move-With -command ($command.Trim())
    }
    else
    {
        Write-Host "  $($command[0]): command not found" -ForegroundColor DarkRed
    }
}

function Validate-Command()
{
    param(
        [string]
        $command
    )
    return [bool](Get-Command -Name $command -ErrorAction SilentlyContinue)
}

Set-Alias attach Invoke-With

