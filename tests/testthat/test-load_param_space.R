context("load_param_space")

test_that("test load_param_space loads oceanic_ontogeny
          parameter space", {
  oceanic_ontogeny_param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny"
    )
  expect_equal(nrow(oceanic_ontogeny_param_space), 1152)
  expect_equal(ncol(oceanic_ontogeny_param_space), 20)
  expect_equal(names(oceanic_ontogeny_param_space),
               c("time", "M", "lac", "mu_min", "mu_p", "K",
                 "gam", "laa", "island_ontogeny", "sea_level",
                 "max_area", "peak_time", "sharpness",
                 "total_island_age", "sea_level_amplitude",
                 "sea_level_frequency", "island_gradient_angle",
                 "extcutoff", "x_s", "x_nonend"))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[1]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[2]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[3]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[4]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[5]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[6]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[7]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[8]]))
  expect_true(is.character(oceanic_ontogeny_param_space[[9]]))
  expect_true(is.character(oceanic_ontogeny_param_space[[10]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[11]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[12]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[13]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[14]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[15]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[16]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[17]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[18]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[19]]))
  expect_true(is.numeric(oceanic_ontogeny_param_space[[20]]))
})

test_that("test load_param_space loads oceanic_sea_level
          parameter space", {
  oceanic_sea_level_param_space <- load_param_space(
    param_space_name = "oceanic_sea_level"
  )
  expect_equal(nrow(oceanic_sea_level_param_space), 3456)
  expect_equal(ncol(oceanic_sea_level_param_space), 20)
  expect_equal(names(oceanic_sea_level_param_space),
               c("time", "M", "lac", "mu_min", "mu_p", "K",
                 "gam", "laa", "island_ontogeny", "sea_level",
                 "max_area", "peak_time", "sharpness",
                 "total_island_age", "sea_level_amplitude",
                 "sea_level_frequency", "island_gradient_angle",
                 "extcutoff", "x_s", "x_nonend"))
  expect_true(is.numeric(oceanic_sea_level_param_space[[1]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[2]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[3]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[4]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[5]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[6]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[7]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[8]]))
  expect_true(is.character(oceanic_sea_level_param_space[[9]]))
  expect_true(is.character(oceanic_sea_level_param_space[[10]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[11]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[12]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[13]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[14]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[15]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[16]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[17]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[18]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[19]]))
  expect_true(is.numeric(oceanic_sea_level_param_space[[20]]))
})

test_that("test load_param_space loads oceanic_ontogeny_sea_level
          parameter space", {
  oceanic_ontogeny_sea_level_param_space <- load_param_space(
    param_space_name = "oceanic_ontogeny_sea_level"
  )
  expect_equal(nrow(oceanic_ontogeny_sea_level_param_space), 3456)
  expect_equal(ncol(oceanic_ontogeny_sea_level_param_space), 20)
  expect_equal(names(oceanic_ontogeny_sea_level_param_space),
               c("time", "M", "lac", "mu_min", "mu_p", "K",
                 "gam", "laa", "island_ontogeny", "sea_level",
                 "max_area", "peak_time", "sharpness",
                 "total_island_age", "sea_level_amplitude",
                 "sea_level_frequency", "island_gradient_angle",
                 "extcutoff", "x_s", "x_nonend"))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[1]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[2]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[3]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[4]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[5]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[6]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[7]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[8]]))
  expect_true(is.character(oceanic_ontogeny_sea_level_param_space[[9]]))
  expect_true(is.character(oceanic_ontogeny_sea_level_param_space[[10]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[11]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[12]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[13]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[14]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[15]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[16]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[17]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[18]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[19]]))
  expect_true(is.numeric(oceanic_ontogeny_sea_level_param_space[[20]]))
})

test_that("test load_param_space loads nonoceanic parameter space", {
  nonoceanic_param_space <- load_param_space(
    param_space_name = "nonoceanic"
  )
  expect_equal(nrow(nonoceanic_param_space), 2916)
  expect_equal(ncol(nonoceanic_param_space), 9)
  expect_equal(names(nonoceanic_param_space),
               c("time", "M", "lac", "mu", "K", "gam", "laa", "x_s",
                 "x_nonend"))
  expect_true(is.numeric(nonoceanic_param_space[[1]]))
  expect_true(is.numeric(nonoceanic_param_space[[2]]))
  expect_true(is.numeric(nonoceanic_param_space[[3]]))
  expect_true(is.numeric(nonoceanic_param_space[[4]]))
  expect_true(is.numeric(nonoceanic_param_space[[5]]))
  expect_true(is.numeric(nonoceanic_param_space[[6]]))
  expect_true(is.numeric(nonoceanic_param_space[[7]]))
  expect_true(is.numeric(nonoceanic_param_space[[8]]))
  expect_true(is.numeric(nonoceanic_param_space[[9]]))
})

test_that("test load_param_space loads nonoceanic_sea_level parameter space", {
  nonoceanic_sea_level_param_space <- load_param_space(
    param_space_name = "nonoceanic_sea_level"
  )
  expect_equal(nrow(nonoceanic_sea_level_param_space), 31104)
  expect_equal(ncol(nonoceanic_sea_level_param_space), 20)
  expect_equal(names(nonoceanic_sea_level_param_space),
               c("time", "M", "lac", "mu_min", "mu_p", "K",
                 "gam", "laa", "island_ontogeny", "sea_level",
                 "max_area", "peak_time", "sharpness",
                 "total_island_age", "sea_level_amplitude",
                 "sea_level_frequency", "island_gradient_angle",
                 "extcutoff", "x_s", "x_nonend"))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[1]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[2]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[3]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[4]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[5]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[6]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[7]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[8]]))
  expect_true(is.character(nonoceanic_sea_level_param_space[[9]]))
  expect_true(is.character(nonoceanic_sea_level_param_space[[10]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[11]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[12]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[13]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[14]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[15]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[16]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[17]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[18]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[19]]))
  expect_true(is.numeric(nonoceanic_sea_level_param_space[[20]]))
})

test_that("test load_param_space loads nonoceanic_land_bridge parameter
          space", {
  nonoceanic_land_bridge_param_space <- load_param_space(
    param_space_name = "nonoceanic_land_bridge"
  )
  expect_equal(nrow(nonoceanic_land_bridge_param_space), 3888)
  expect_equal(ncol(nonoceanic_land_bridge_param_space), 15)
  expect_equal(names(nonoceanic_land_bridge_param_space),
               c("time", "M", "lac_1", "mu_1", "K_1", "gam_1",
                 "laa_1", "x_s", "x_nonend", "shift_times",
                 "lac_2", "mu_2", "K_2", "gam_2", "laa_2"))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[1]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[2]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[3]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[4]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[5]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[6]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[7]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[8]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[9]]))
  expect_true(is.character(nonoceanic_land_bridge_param_space[[10]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[11]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[12]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[13]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[14]]))
  expect_true(is.numeric(nonoceanic_land_bridge_param_space[[15]]))
})
