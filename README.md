Quick Install
=============

Simply run this script to install these files into your home directory:

    wget -O - https://github.com/sumpygump/dotfiles/raw/master/autoinstall.sh | sh
    
Contents and Purpose
====================

These are dotfiles that setup a sane environment I am used to on a linux machine in my home directory. It includes:

 * bash config files
   * `.bash_profile`
   * `.bashrc`
   * `.bash_aliases`
 * git config file `.gitconfig`

## Starship

Install starship https://starship.rs/guide/#%F0%9F%9A%80-installation

Copy or symlink the file `.config/starship.toml` to `~/.config/starship.toml`

Be sure the following is in your `~/.profile` or `~/.bashrc` file:

```
# Starship
eval "$(starship init bash)"
```
