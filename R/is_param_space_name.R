#' Checks whether the parameter space name give is one of the parameter spaces
#' that are included in the DAISIErobustness package
#'
#' @inheritParams default_params_doc
#'
#' @return Boolean
#' @export
#'
#' @examples
#' bool <- is_param_space_name("oceanic_ontogeny_cs")
is_param_space_name <- function(param_space_name) {
  if (param_space_name %in% c("oceanic_ontogeny_cs",
                              "oceanic_ontogeny_di",
                              "oceanic_ontogeny_iw",
                              "oceanic_sea_level_cs",
                              "oceanic_sea_level_di",
                              "oceanic_sea_level_iw",
                              "oceanic_ontogeny_sea_level_cs",
                              "oceanic_ontogeny_sea_level_di",
                              "oceanic_ontogeny_sea_level_iw",
                              "continental_cs",
                              "continental_di",
                              "continental_iw",
                              "continental_land_bridge_cs",
                              "continental_land_bridge_di",
                              "continental_land_bridge_iw",
                              "trait_CES",
                              "oceanic",
                              "trait_CES_2K",
                              "trait_no_trans")) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
