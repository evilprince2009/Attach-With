# attach

Command prefixing for continuous workflow using single tool.

### Installation

Not yet available in PoowerShellGallery. Install it manuall my putting it inside your `Modules` directory. 

Now, put this line `Import-Module -Name Add-With` inside your PowerShell profile. To edit your PowerShell profile, open powershell, type notepad $profile & hit `<Enter>`.

### Usage

    `PS > attach <program>`

Starts an interactive shell with where every command is prefixed using `<program>`.

For example:

    `PS> attach dotnet`
    `PS dotnet> restore`
    `PS dotnet> build`
    `PS dotnet> run`

![attach](https://github.com/evilprince2009/Attach-With/blob/main/images/attach.gif)
    
To repeat commands:

    `PS> attach g++ -o output input.c
    PS g++ -o -output main.cpp>
    <enter>
    Compiling...
    PS g++ -o -output main.cpp>`

Execute a shell command with with `:` prefix.

    `PS g++> :dir`

To exit use `q` or `quit`.