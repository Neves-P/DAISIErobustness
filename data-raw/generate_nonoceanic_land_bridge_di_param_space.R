# Nonoceanic land-bridge diversity-independent
## Young

young_lb_di_temp <- expand.grid(time = 2.55,
                                M = 1000,
                                lac_1 = c(0.5, 1),
                                mu_1 = c(0.5, 1),
                                K_1 = Inf,
                                gam_1 = c(0.01, 0.05),
                                laa_1 = 1,
                                x_s = c(0.01, 0.05),
                                x_nonend = c(0.1, 0.9),
                                shift_times = I(list(c(1.225, 1.325))),
                                divdepmodel = "CS",
                                stringsAsFactors = FALSE)

young_lb_di_2 <- cbind(young_lb_di_temp,
                       lac_2 = young_lb_di_temp[, 3] / 2,
                       mu_2 = young_lb_di_temp[, 4] / 2,
                       K_2 = Inf,
                       gam_2 = young_lb_di_temp[, 6] * 2,
                       laa_2 = 0)

young_lb_di_10 <- cbind(young_lb_di_temp,
                        lac_2 = young_lb_di_temp[, 3] / 2,
                        mu_2 = young_lb_di_temp[, 4] / 2,
                        K_2 = Inf,
                        gam_2 = young_lb_di_temp[, 6] * 10,
                        laa_2 = 0)

young_lb_di <- rbind(young_lb_di_2, young_lb_di_10)

## Old

old_lb_di_temp <- expand.grid(time = 6.15,
                              M = 1000,
                              lac_1 = c(0.5, 1),
                              mu_1 = c(0.5, 1),
                              K_1 = Inf,
                              gam_1 = c(0.01, 0.05),
                              laa_1 = 1,
                              x_s = c(0.01, 0.05),
                              x_nonend = c(0.1, 0.9),
                              shift_times = I(list(c(3.025, 3.125))),
                              divdepmodel = "CS",
                              stringsAsFactors = FALSE)

old_lb_di_2 <- cbind(old_lb_di_temp,
                     lac_2 = old_lb_di_temp[, 3] / 2,
                     mu_2 = old_lb_di_temp[, 4] / 2,
                     K_2 = Inf,
                     gam_2 = old_lb_di_temp[, 6] * 2,
                     laa_2 = 0)

old_lb_di_10 <- cbind(old_lb_di_temp,
                      lac_2 = old_lb_di_temp[, 3] / 2,
                      mu_2 = old_lb_di_temp[, 4] / 2,
                      K_2 = Inf,
                      gam_2 = old_lb_di_temp[, 6] * 10,
                      laa_2 = 0)

old_lb_di <- rbind(old_lb_di_2, old_lb_di_10)

# Complete nonoceanic land-bridge diversity-independent parameter set

nonoceanic_land_bridge_di <- rbind(
  young_lb_di,
  old_lb_di
)

usethis::use_data(nonoceanic_land_bridge_di, overwrite = TRUE)
