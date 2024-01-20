# attach

Command prefixing for continuous workflow using single tool.

### Installation

Open a PowerShell Instance and run `Install-Module -Name attach-with`.

Now, put this line `Import-Module -Name attach-with` inside your PowerShell profile and save. To edit your PowerShell profile, open powershell, type notepad $profile & hit `<Enter>`.

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

## Ibne Nahian

- #### [LinkedIn](https://www.linkedin.com/in/evilprince2009/)
- #### [Upwork](https://www.upwork.com/freelancers/~01ded0be5baccfa296)