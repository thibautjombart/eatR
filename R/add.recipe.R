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
add.recipe <- function(x, title = NULL,
                       date = NULL,
                       author = NULL,
                       ingredients = NULL,
                       description = NULL) {
    template <- system.file("recipes/template.yml", package="eatR")
    out <- read.recipe(template)

    ## fill in stuff if provided
    if (!is.null(title)) {
        out$title <- title
    }
    if (!is.null(date)) {
        out$date <- date
    }
    if (!is.null(author)) {
        out$author <- author
    }
    if (!is.null(ingredients)) {
        out$ingredients <- ingredients
    }
    if (!is.null(description)) {
        out$description <- description
    }
   return(out)
}

