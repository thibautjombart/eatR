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
#' @param x a yml file to save the recipe; if NULL, no file is saved
#' @param title the title of the recipe
#' @param date the date of entry, e.g. 2016-08-19
#' @param author the author of the recipe
#' @param ingredients a vector of characters indicating ingredients
#' @param description a vector of characters giving cooking instructions
#'
#' @export
#'
add.recipe <- function(x = "new.recipe.yml", title = NULL,
                       date = NULL,
                       author = NULL,
                       ingredients = NULL,
                       description = NULL) {
    template <- system.file("recipes/template.yml", package="eatR")
    out <- read.recipe(template)

    ## fill in stuff if provided
    if (!is.null(title)) {
        out$title <- as.character(title)
    }
    if (!is.null(date)) {
        out$date <- as.Date(date)
    }
    if (!is.null(author)) {
        out$author <- as.character(author)
    }
    if (!is.null(ingredients)) {
        out$ingredients <- as.character(ingredients)
    }
    if (!is.null(description)) {
        out$description <- as.character(description)
    }

    if (!is.null(x)) {
        cat(sprintf("\nCreating new recipe in file %s\n", x))
        cat(yaml::as.yaml(out), file=x)
        return(invisible(out))
    }

    return(out)
}

