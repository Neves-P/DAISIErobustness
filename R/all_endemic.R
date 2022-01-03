#' Calculates the number of endemic and non-endemics species on a single island
#' replicate
#'
#' @inheritParams default_params_doc
#' @return Boolean
#' @author Joshua W. Lambert
all_endemic <- function(island) {
  island <- island[-1]
  stacs <- unlist(lapply(island, "[[", "stac"))
  num_endemic_cols <- length(which(stacs %in% c(2, 5, 6)))
  num_non_endemic_cols <- length(which(stacs %in% c(1, 4)))
  if (any(stacs == 3)) {
    recol <- island[which(stacs == 3)]
    all_cols <- lapply(recol, "[[", "all_colonisations")
    species_type <- unlist(
      lapply(all_cols, function(x) {lapply(x, "[[", "species_type")})
    )
    num_recol_endemic_cols <- length(which(species_type %in% c("C", "A")))
    num_recol_non_endemic_cols <- length(which(species_type %in% c("I")))
    num_endemic_cols <- num_endemic_cols + num_recol_endemic_cols
    num_non_endemic_cols <- num_non_endemic_cols + num_recol_non_endemic_cols
  }
  testit::assert(num_endemic_cols >= 0)
  testit::assert(num_non_endemic_cols >= 0)
  if (num_endemic_cols == 0 && num_non_endemic_cols == 0) {
    stop("Island is empty")
  }
  if (num_non_endemic_cols > 0) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}
