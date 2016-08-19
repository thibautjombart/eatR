#' Read recipe from yaml file
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
#' template <- system.file("recipes/template.yml", package="eatR")
#' read.recipe(template)
#'
#' @export
#'
#' @param x the name of the recipe file to read
#'
read.recipe <- function(x) {
    out <- yaml::yaml.load_file(x)

    ## here we simply check that the required fields are there
    fields <- c("author", "date", "description", "ingredients", "title")
    out.names <- sort(names(out))
    if (!identical(out.names, fields)) {
        stop("the following fields are missing: ",
             paste0(fields[!fields %in% out.names], collapse = " ")
             )
    }

    return(out)
}

