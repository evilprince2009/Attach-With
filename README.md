# attach

Command prefixing for continuous workflow using single tool.

### Installation

Not yet available in PoowerShellGallery. Install it manuall my putting it inside your `Modules` directory.

### Usage

    `PS > attach <program>`

Starts an interactive shell with where every command is prefixed using `<program>`.

For example:

    `PS> attach dotnet`
    `PS dotnet> restore`
    `PS dotnet> build`
    `PS dotnet> run`
    
To repeat commands:

    `PS> attach g++ -o output input.c
    PS g++ -o -output main.cpp>
    <enter>
    Compiling...
    PS g++ -o -output main.cpp>`