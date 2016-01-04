
# My bash setup

Not much cool here. Just finding a safe location for my configs.

## Installation instructions

1. clone this repository
1. link the bashrc in this repo to .bashrc in your homedir

    `ln -s ~/dotbashstuff/bashrc ~/.bashrc` 

1. link the bash_profile in this repo to .bash_profile in your homedir

    `ln -s ~/dotbashstuff/bash_profile ~/.bash_profile` 
1. update submodules

    `git submodule init`

1. link toggle solarized script

    `mkdir -p ~/Library/Application\ Support/iTerm/Scripts`
    `ln -s ~/dotbashstuff/borrowed/iterm2-colors-solarized-toggle/Toggle\ Solarized.scpt ~/Library/Application\ Support/iTerm/Scripts/Toggle\ Solarized.scpt`


## License

If for some crazy reason you want to use this it is offered with no warranty. 
This project, however, is released under the [MIT](http://opensource.org/licenses/MIT) 
license.

Copyright © 2013 robert tomb
