require(DAISIE)

#### Maui Nui pilot run #### 22/1/2020

n_mainland_species <- 1000
simulation_time <- 2.55
clado_rate <- c(0.00009, 0.00017)
clade_carr_cap <- c(0.0015, Inf)  # clade-level carrying capacity
imm_rate <- c(0.000001, 0.000002)
ana_rate <- c(1, 2)
max_area <- 13500
peak_time <- 0.36 # 1.03 / 2.86413
sharpness <- 1
total_island_age <- c(2.86413)
sea_level_amplitude <- 0
sea_level_frequency <- 0
mu_min <- c(0.8, 1.6) #c(0.8, 1.6)
mu_max <- 50
ext_pars <- c(mu_min, mu_max)
island_ontogeny <- "beta"
sea_level <- "const"
extcutoff <- 1000
hyper_pars <- NULL
area_pars <- create_area_pars(
  max_area = max_area,
  proportional_peak_t = peak_time,
  peak_sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = 0,
  sea_level_frequency = 0
)

dist_pars <- NULL
# default_pars <- create_default_pars(
#   island_ontogeny = island_ontogeny,
#   sea_level = sea_level,
#   area_pars = area_pars,
#   hyper_pars = hyper_pars,
#   dist_pars = dist_pars,
#   ext_pars = ext_pars,
#   totaltime = island_age
# )


# DAISIE_calc_sumstats_pcrates(
#   pars = c(clado_rate[1], 1, clade_carr_cap[1], imm_rate[1], ana_rate[1]),
#   ext_pars = c(default_pars$ext_pars[1], default_pars$ext_pars[3]),
#   totaltime = island_age,
#   area_pars = default_pars$area_pars,
#   hyper_pars = default_pars$hyper_pars,
#   dist_pars = default_pars$dist_pars,
#   island_ontogeny = translate_island_ontogeny(island_ontogeny),
#   sea_level = translate_sea_level(sea_level),
#   extcutoff = extcutoff,
#   mainland_n = n_mainland_species
# )

# DAISIE_plot_area(
#   totaltime = island_age,
#   area_pars = area_pars,
#   island_ontogeny = island_ontogeny,
#   resol = 0.001
# )
##### MEAN AREA PARS ####

total_island_age <- 2.86413
peak_time <- 0.36
simulation_time <- 2.55

pilot_run_pars_mean <- expand.grid(
  simulation_time = simulation_time,
  n_mainland_species = n_mainland_species,
  clado_rate = clado_rate,
  clade_carr_cap = clade_carr_cap,
  imm_rate = imm_rate,
  ana_rate = ana_rate,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  mu_min = mu_min,
  mu_max = mu_max,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  extcutoff = extcutoff
)

##### MAX AREA PARS ####

total_island_age <- 3.33547
peak_time <- 0.34
simulation_time <- 3
pilot_run_pars_max <- expand.grid(
  simulation_time = simulation_time,
  n_mainland_species = n_mainland_species,
  clado_rate = clado_rate,
  clade_carr_cap = clade_carr_cap,
  imm_rate = imm_rate,
  ana_rate = ana_rate,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  mu_min = mu_min,
  mu_max = mu_max,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  extcutoff = extcutoff
)

##### MIN AREA PARS ####

total_island_age <- c(2.392779)
peak_time <- 0.40
simulation_time = 2.1
pilot_run_pars_min <- expand.grid(
  simulation_time = simulation_time,
  n_mainland_species = n_mainland_species,
  clado_rate = clado_rate,
  clade_carr_cap = clade_carr_cap,
  imm_rate = imm_rate,
  ana_rate = ana_rate,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  mu_min = mu_min,
  mu_max = mu_max,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  extcutoff = extcutoff
)

# Final parameter list
final_maui_parameters <- rbind(pilot_run_pars_min, pilot_run_pars_mean, pilot_run_pars_max)

write.csv(final_maui_parameters, file = "C:/Users/p282067/Desktop/final_maui_parameters.csv")

