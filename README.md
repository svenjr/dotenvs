# Sven's DOTENVs

This public repo simply makes my life easier by being my source-of-truth for my "dotenvs" - the files that pretty much control the configuration of any tools I use.

Currently, those include:
- `.zshrc` (ZSH config)
- `.bash_profile` (bash config)
- `.vimrc` (vim config)
- `.psqlrc` (PSQL config)
- `.gitignore` (Tell git what not to look for)
- `.sqliterc` (SQLite Config)
- `init.vim` (neovim config setup - belongs in `~/.config/nvim/init.vim`)

So that I don't forget: To get these working on a new system/machine, make sure to git clone this repo and then symlink correctly like so:

```shell
ln -s [absolute path to source from this repo] [absolute path to target]
```

**Important:** Always use absolute paths for both source and target to avoid broken symlinks.

Here are examples:
```shell
# .zshrc
ln -s ~/Documents/dotenvs/.zshrc ~/.zshrc

# neovim config (requires creating the directory first if it doesn't exist)
mkdir -p ~/.config/nvim
ln -s ~/Documents/checkouts/svenjr/dotenvs/init.vim ~/.config/nvim/init.vim
```
