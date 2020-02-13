#### area parameters Kauai ####

n_mainland_species <- 1000
island_age <- 10
clado_rate <- 0.00016 # c(0.00008, 0.00016)
clade_carr_cap <- 0.05 #c(0.05, Inf)  # clade-level carrying capacity
imm_rate <- 0.002 # c(0.001, 0.002)
ana_rate <- 1 # c(1, 2)
island_type <- "oceanic"
max_area <- 13500
peak_time <- 0.1
sharpness <- 1
total_island_age <- 15
sea_level_amplitude <- 0
sea_level_frequency <- 0
mu_min <- 1 #c(1, 2)
mu_max <- 50
ext_pars <- c(mu_min, mu_max)
island_ontogeny <- "beta"
sea_level <- "const"
extcutoff <- 1000
hyper_pars <- NULL
area_pars <- create_area_pars(
  max_area,
  peak_time,
  sharpness,
  total_island_age,
  sea_level_amplitude,
  sea_level_frequency
)
dist_pars <- NULL
default_pars <- create_default_pars(
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  area_pars = area_pars,
  hyper_pars = hyper_pars,
  dist_pars = dist_pars,
  ext_pars = ext_pars,
  totaltime = island_age
)

DAISIE_calc_sumstats_pcrates(
  pars = c(clado_rate, 1, clade_carr_cap, imm_rate, ana_rate),
  ext_pars = c(mu_min, mu_max),
  totaltime = island_age,
  area_pars = default_pars$area_pars,
  hyper_pars = default_pars$hyper_pars,
  dist_pars = default_pars$dist_pars,
  island_ontogeny = translate_island_ontogeny(island_ontogeny),
  sea_level = translate_sea_level(sea_level),
  extcutoff = extcutoff,
  mainland_n = n_mainland_species
)

