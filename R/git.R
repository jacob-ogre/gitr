#' \code{git add --all}, aka, quick-add
#'
#' @return Any results from running \code{git add --all}
#' @export
#' @examples
#' # Gqa()
Gqa <- function() {
  system("git add --all")
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
Gpush <- function() {
  system("git pull")
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
