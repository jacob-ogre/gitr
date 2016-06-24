## gitr

Basic git commands to use from the R console.

## Usage

This initial version includes just the functions (and flags) I use most-often.

`Ginit()` initializes the pwd as a git repository, but checks that it's not already a repo (though a `force` option is available to re-init).

`Gadd()` with no arguments does `git add --all`; adding arguments catenates a full `git add` command.

`Gcommit("A message")` performs a commit on added files; fails if no message is given.

`Gqa("A message")` is a quick add & commit, i.e., `git add --all && git commit -m 'A message'`. Use with appropriate caution.

`Gstatus()` returns the current status of the repo.

`Gremotev()` returns the remotes (fetch and push) for the repo.

`Gpush()` pushes current committed changes to the remote.

`Gpull()` pulls any new changes. __WARNING__: I'm not sure what will happen if a merge is required - R may crash - so _use with care!_

`Git(cmd)` is just a base git call, i.e., `system(git [cmd])` with cmd catenated before the system call.

## Justification

I'm used to working in the terminal, and have Vim set up with [tpope's vim-fugitive](https://github.com/tpope/vim-fugitive) so that adding, committing, pushing, etc. are all done in Ex-mode. But iTerm acts up sometimes and RStudio will work. Except for the git integration...using the mouse to click through files to add, commit, etc., makes carrying out the "commit early, commit often" mantra more difficult than I want. [git2r](https://github.com/ropensci/git2r) has all of the git functions, but the need to initialize each time is a hassle (and I will forget). 

So the functions in this package - which is in _early_ development - just make `system` calls from the current working directory. That means that the calls only work for commits in `getwd()` (unless the `Git()` function is used to commit elsewhere), but that's almost always OK.
