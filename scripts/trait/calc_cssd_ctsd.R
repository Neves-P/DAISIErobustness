# calculate the standard diviation of clade size
clade_size_sd <- function(sim){
  clade_size <- list()
  for(i in 1:length(sim)){  ## replicates
    num_spec <- c()
    for(j in 2:length(sim[[i]][[1]])){ ##clades
      num_spec[j - 1] <- length(sim[[i]][[1]][[j]]$branching_times) - 1
    }
    clade_size[[i]] <- num_spec
  }
  clade_size_sd <- as.vector(unlist(lapply(clade_size, sd)))
  return(clade_size_sd)
}


colon_time_sd <- function(sim){
  colon_time <- list()
  for(i in 1:length(sim)){  ## replicates
    fist_colon_time <- c()
    for(j in 2:length(sim[[i]][[1]])){ ##clades
      fist_colon_time[j - 1] <- sim[[i]][[1]][[j]]$branching_times[2]
    }
    colon_time[[i]] <- fist_colon_time
  }
  colon_time_sd <- as.vector(unlist(lapply(colon_time, sd)))
  return(colon_time_sd)
}

calc_clade_size_error <- function(output){
  novel_sim <- output$passed_novel_sims
  oceanic_sim1 <- output$passed_oceanic_sims_1
  oceanic_sim2 <- output$passed_oceanic_sims_2
  novel_sim_cs_sd <- clade_size_sd(novel_sim)
  oceanic_sim1_cs_sd <- clade_size_sd(oceanic_sim1)
  oceanic_sim2_cs_sd <- clade_size_sd(oceanic_sim2)
  clade_size_error <- abs(novel_sim_cs_sd - oceanic_sim1_cs_sd)
  clade_size_baseline_error <- abs(oceanic_sim1_cs_sd - oceanic_sim2_cs_sd)
  clade_size <- list(clade_size_error = clade_size_error,
                     clade_size_baseline_error = clade_size_baseline_error)
}


calc_colon_time_error <- function(output){
  novel_sim <- output$passed_novel_sims
  oceanic_sim1 <- output$passed_oceanic_sims_1
  oceanic_sim2 <- output$passed_oceanic_sims_2
  novel_sim_ct_sd <- colon_time_sd(novel_sim)
  oceanic_sim1_ct_sd <- colon_time_sd(oceanic_sim1)
  oceanic_sim2_ct_sd <- colon_time_sd(oceanic_sim2)
  colon_time_error <- abs(novel_sim_ct_sd - oceanic_sim1_ct_sd)
  colon_time_baseline_error <- abs(oceanic_sim1_ct_sd - oceanic_sim2_ct_sd)
  colon_time <- list(colon_time_error = colon_time_error,
                     colon_time_baseline_error = colon_time_baseline_error)
}


num_clade <- function(sim){
  num_clade <- c()
  for(i in 1:length(sim)){  ## replicates
    #clades
      num_clade[i] <- length(sim[[i]][[1]]) - 1
  }
  return(num_clade)
}
