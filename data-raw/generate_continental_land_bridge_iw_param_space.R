# Continental land-bridge island-wide diversity-dependent
## Young

young_lb_dd_temp <- expand.grid(time = 2.55,
                                M = 1000,
                                lac_1 = c(0.5, 1),
                                mu_1 = c(0.5, 1),
                                K_1 = 100,
                                gam_1 = c(0.01, 0.05),
                                laa_1 = 1,
                                x_s = c(0.01, 0.05),
                                x_nonend = c(0.1, 0.9),
                                shift_times = I(list(c(1.225, 1.325))),
                                divdepmodel = "IW",
                                stringsAsFactors = FALSE)

young_lb_dd_2 <- cbind(young_lb_dd_temp,
                       lac_2 = young_lb_dd_temp[, 3],
                       mu_2 = young_lb_dd_temp[, 4],
                       K_2 = 100,
                       gam_2 = young_lb_dd_temp[, 6] * 2,
                       laa_2 = 0)

young_lb_dd_10 <- cbind(young_lb_dd_temp,
                        lac_2 = young_lb_dd_temp[, 3],
                        mu_2 = young_lb_dd_temp[, 4],
                        K_2 = 100,
                        gam_2 = young_lb_dd_temp[, 6] * 10,
                        laa_2 = 0)

young_lb_dd <- rbind(young_lb_dd_2, young_lb_dd_10)

## Old

old_lb_dd_temp <- expand.grid(time = 6.15,
                              M = 1000,
                              lac_1 = c(0.5, 1),
                              mu_1 = c(0.5, 1),
                              K_1 = 100,
                              gam_1 = c(0.01, 0.05),
                              laa_1 = 1,
                              x_s = c(0.01, 0.05),
                              x_nonend = c(0.1, 0.9),
                              shift_times = I(list(c(3.025, 3.125))),
                              divdepmodel = "IW",
                              stringsAsFactors = FALSE)

old_lb_dd_2 <- cbind(old_lb_dd_temp,
                     lac_2 = old_lb_dd_temp[, 3],
                     mu_2 = old_lb_dd_temp[, 4],
                     K_2 = 100,
                     gam_2 = old_lb_dd_temp[, 6] * 2,
                     laa_2 = 0)

old_lb_dd_10 <- cbind(old_lb_dd_temp,
                      lac_2 = old_lb_dd_temp[, 3],
                      mu_2 = old_lb_dd_temp[, 4],
                      K_2 = 100,
                      gam_2 = old_lb_dd_temp[, 6] * 10,
                      laa_2 = 0)

old_lb_dd <- rbind(old_lb_dd_2, old_lb_dd_10)

# Complete continental land-bridge island-wide diversity-dependent parameter
# set

continental_land_bridge_iw <- rbind(
  young_lb_dd,
  old_lb_dd
)

save(continental_land_bridge_iw,
     file = "inst/extdata/continental_land_bridge_iw.rda")
