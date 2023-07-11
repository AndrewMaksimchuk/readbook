# readbook


### Description

CLI application for read only one book  
automatically  


### First start

Run `sudo ./install.bash` from project directory  
`sudo` need for add to shell complition directory  
This add path to this directory to app entry  
point in `PATH` variable to `.bashrc` or `.zshrc`  
After that add shell complition(bash and zsh)  
and make all `.bash` file to be executable  


### Usage

See [usage](usage)  


### Config file(config)

Key-value storage  

| key | description |
| --- | ----------- |
|`book`             | path to book, set by use 'add' command |
|`pages`            | total number of pages in book          |
|`current_page`     | what page read(starts with 1)          |
|`output_format`    | supported output format (default image)|
|`input_format`     | supported book format (default pdf)    |
