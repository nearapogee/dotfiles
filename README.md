## Installation

```bash
apt install zsh vim-nox
chsh -s zsh
mkdir -p ~/bin
git clone git@github.com:nearapoee/dotfiles.git ~/bin/dotfiles
git submodule init
git submodule update
cd ~/bin/dotfiles && ./install
```

NOTE: Make sure `vim --version | grep ruby` returns +ruby

## Update submodules

```bash
git submodule foreach git pull origin master
```

## Add vim pathogen plugin
```bash
git submodule add https://github.com/.../NAME vim/bundle/NAME
```

## Remove vim pathogen plugin
Remove with usual [submodule removal](https://www.w3docs.com/snippets/git/how-to-remove-a-git-submodule.html)


ZSH Load Order Reference:
+----------------+-----------+-----------+------+
|                |Interactive|Interactive|Script|
|                |login      |non-login  |      |
+----------------+-----------+-----------+------+
|/etc/zshenv     |    A      |    A      |  A   |
+----------------+-----------+-----------+------+
|~/.zshenv       |    B      |    B      |  B   |
+----------------+-----------+-----------+------+
|/etc/zprofile   |    C      |           |      |
+----------------+-----------+-----------+------+
|~/.zprofile     |    D      |           |      |
+----------------+-----------+-----------+------+
|/etc/zshrc      |    E      |    C      |      |
+----------------+-----------+-----------+------+
|~/.zshrc        |    F      |    D      |      |
+----------------+-----------+-----------+------+
|/etc/zlogin     |    G      |           |      |
+----------------+-----------+-----------+------+
|~/.zlogin       |    H      |           |      |
+----------------+-----------+-----------+------+
|                |           |           |      |
+----------------+-----------+-----------+------+
|                |           |           |      |
+----------------+-----------+-----------+------+
|~/.zlogout      |    I      |           |      |
+----------------+-----------+-----------+------+
|/etc/zlogout    |    J      |           |      |
+----------------+-----------+-----------+------+

## VIM Features
+ Leader is \.

ominicompletion:
+ Setup for ruby and for rails.

vimrc:
+ Edit vimrc with <leader>v
+ Auto-source when vimrc is written.

spell checking:
+ Toggle spelling with <C-s> in normal/insert mode.
+ Default <]s> (forward), <[s> (backword), <z=> (suggest), and <zg> good
addition.

plugins:
+ bufexplorer
+ NERDTree
+ snipMate
+ vim-rails
+ vjde
+ surround
+ tagtag
+ dbtext
+ taglist
