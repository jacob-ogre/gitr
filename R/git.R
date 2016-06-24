#' \code{git init} a new repo
#'
#' Checks that there isn's a .git directory first so that a repo isn't re-inited
#' (unless you force).
#'
#' @param force Whether to force init [FALSE]
#' @return Any results from running \code{git init}
#' @export
#' @examples
#' # Ginit()
Ginit <- function(force = FALSE) {
  if(dir.exists(".git") & !force) {
    stop("Already a repo! Use `force = TRUE` if you want to re-init.")
  }
  system("git init")
}

#' \code{git add --all}, aka, quick-add
#'
#' @return Any results from running \code{git add --all}
#' @export
#' @examples
#' # Gadd()
Gadd <- function() {
  system("git add --all")
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
