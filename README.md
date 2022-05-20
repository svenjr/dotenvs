# Sven's DOTENVs

This public repo simply makes my life easier by being my source-of-truth for my "dotenvs" - the files that pretty much control the configuration of any tools I use.

Currently, those include:
- `.zshrc` (ZSH config)
- `.bash_profile` (bash config)
- `.vimrc` (vim config)
- `.psqlrc` (PSQL config)
- `.gitignore` (Tell git what not to look for)

So that I don't forget: To get these working on a new system/machine, make sure to git clone this repo and then symlink correctly like so:

```shell
ln -s [source from this repo] [target]
```

Here is an example for the `.zshrc`:
```shell
ln -s ~/Documents/dotenvs/.zshrc ~/.zshrc
```
