#' Add recipe from yaml file
#'
#' This function reads a recipe described in a yaml file. Fields must contain:
#' \itemize{
#' \item title: the title of the recipe
#' \item date: the date the recipe was written
#' \item author: the author of the recipe
#' \item email: the email of the author
#' \item ingredients: a list of ingredients
#' \item description: a list of instructions
#' }
#'
#' @author Thibaut Jombart \email{thibautjombart@@gmail.com}
#'
#' @examples
#' add.recipe("test")
#' file.show("test.yml")
#'
#' @export
#'
#' @param ... arguments passed to 'dir'
#'
list.recipes <- function(...) {
    dir(system.file("recipes", package="eatR"), ...)
}

