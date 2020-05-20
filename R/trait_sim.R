#' Runs DAISIE simulation with traits
#'
#' @inheritParams default_params_doc
#' @author Shu Xie
#' @return A list output from
#'   \code{\link[DAISIE]{DAISIE_sim_trait_dependent}()}.
#' @export
trait_sim <- function(param_space_name,
                      sim_pars,
                      replicates) {
  trait_sim <- list()
  for (i in seq_len(replicates)) {
    trait_sim[[i]] <- DAISIE::DAISIE_sim_trait_dependent(
      time = sim_pars$time,
      M = sim_pars$M,
      pars = sim_pars$pars,
      replicates = 1,
      sample_freq  = Inf,
      plot_sims = FALSE,
      verbose = FALSE,
      trait_pars = sim_pars$trait_pars
    )
  }
  return(trait_sim)
}
