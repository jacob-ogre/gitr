#' \code{git init} a new repo
#'
#' Checks with user that the init is being done in the right directory, to avoid
#' those cases where the user isn't where they think they are. Also checks that
#' there isn's a .git directory first so that a repo isn't re-inited #' (unless
#' \code{force = TRUE}).
#'
#' @param force Whether to force init [FALSE]
#' @return Any results from running \code{git init}
#' @export
#' @examples
#' # Ginit()
Ginit <- function(force = FALSE) {
  pwd <- getwd()
  msg <- paste("This will `git init`", pwd, "Are you sure? (Y/N) ")
  ans <- readline(msg)
  if(ans != "Y") {
    stop("Aborted init...")
  }
  if(dir.exists(".git") & !force) {
    stop("Already a repo! Use `force = TRUE` if you want to re-init.")
  }
  system("git init")
}

#' \code{git add --all}, aka, quick-add
#'
#' @param ... Objects to add; uses '--all' if nothing provided
#' @return Any results from running \code{git add --all}
#' @export
#' @examples
#' # Gadd()
Gadd <- function(...) {
  if(length(list(...)) == 0) {
    system("git add --all")
  } else {
    cmd <- paste("git add", paste(list(...), collapse = " "), sep = " ")
    system(cmd)
  }
}

#' \code{git commit -m 'x'} with message x
#'
#' @param msg A message to include with a commit
#' @return Any results from running commit
#' @export
#' @examples
#' # Gcommit("A silly commit message.")
Gcommit <- function(msg) {
  if(missing(msg)) stop("A message is needed for commit.")
  cmd <- paste("git commit -m '", msg, "'")
  system(cmd, wait = TRUE)
}

#' \code{git add --all && commit -m 'x'} with message x
#'
#' @param msg A message to include with a commit
#' @return Any results from running commit
#' @export
#' @examples
#' # Gqa("A silly commit message.")
Gqa <- function(msg) {
  if(missing(msg)) stop("A message is needed for commit.")
  cmd <- paste("git add --all && git commit -m '", msg, "'")
  system(cmd, wait = TRUE)
}

#' \code{git commit --amend -m 'x'} with message x
#'
#' @param msg A message to include with a commit
#' @return Any results from running \code{git commit --amend -m}
#' @export
#' @examples
#' # Gamend("A silly commit message.")
Gamend <- function(msg) {
  if(missing(msg)) stop("A message is needed for commit.")
  cmd <- paste("git commit --amend -m '", msg, "'")
  system(cmd, wait = TRUE)
}

#' \code{git status}
#'
#' @return Any results from running commit
#' @export
#' @examples
#' # Gstatus()
Gstatus <- function() {
  cmd <- paste("git status")
  system(cmd, wait = TRUE)
}

#' \code{git remote -v}
#'
#' @return The remote for the repo
#' @export
#' @examples
#' # Gremotev()
Gremotev <- function() {
  cmd <- paste("git remote -v")
  system(cmd, wait = TRUE)
}

#' \code{git push} to a remote repo
#'
#' @return Any results from running the command
#' @export
#' @examples
#' # Gpush()
Gpush <- function() {
  system("git push")
}

#' \code{git pull} from a remote repo
#'
#' @return Any results from running \code{git pull}
#' @export
#' @examples
#' # Gpull()
Gpull <- function() {
  system("git pull")
}

#' An empty \code{git} call
#'
#' To be used if a git command doesn't already exist in this package.
#'
#' @param cmd A message to include with a commit
#' @return Any results from running the command
#' @export
#' @examples
#' # git("add .")
Git <- function(cmd = "") {
  command <- paste("git", cmd)
  system(command, wait = TRUE)
}
