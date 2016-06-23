## gitr

Basic git commands to use from the R console.

## Justification

I'm used to working in the terminal, and have Vim set up with [tpope's vim-fugitive](https://github.com/tpope/vim-fugitive) so that adding, committing, pushing, etc. are all done in Ex-mode. But iTerm acts up sometimes and RStudio will work. Except for the git integration...using the mouse to click through files to add, commit, etc., makes carrying out the "commit early, commit often" mantra more difficult than I want. [git2r](https://github.com/ropensci/git2r) has all of the git functions, but the need to initialize each time is a hassle (and I will forget). 

So the functions in this package - which is in _early_ development - just make `system` calls from the current working directory. That means that the calls only work for commits in `getwd()` (unless the `Git()` function is used to commit elsewhere), but that's almost always OK.
