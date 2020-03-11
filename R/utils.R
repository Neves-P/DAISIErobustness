#' Get param_space number from log file
#'
#' @param path String with path where log files are located.
#'
#' @return Numeric vector with param_space of jobs in the log files
#' @export
get_submitted_param_sets <- function(path) {

  all_files <- list.files(path)

  submitted_param_sets <- c()
  for (file in seq_along(all_files)) {

    function_call_line <- readLines(file.path(path, all_files[file]), n = 5)[5]
    pattern <- "param_set=(.*?),"
    param_set <-
      as.numeric(regmatches(
        function_call_line,
        regexec(pattern, function_call_line))[[1]][2]
      )
    submitted_param_sets <- c(submitted_param_sets, param_set)
  }
  return(submitted_param_sets)
}

#' Plots island area function(s) through time
#'
#' Plots area functions through time. If only one set of area and/or sea-level
#' parameters are given, then only one area is plotted.
#' @inheritParams default_params_doc
#'
#' @return a plot with the area size through time
#' @author Pedro Neves, Joshua Lambert
#' @export
DAISIE_plot_areas <- function(totaltime_1,
                              totaltime_2 = NULL,
                              area_pars_1,
                              area_pars_2 = NULL,
                              island_ontogeny_1 = "beta",
                              island_ontogeny_2 = NULL,
                              sea_level_1 = "const",
                              sea_level_2 = NULL,
                              resolution = 0.001,
                              overlay_sea_level = FALSE) {

  resolution <- max(0.00001, resolution)
  check_area_plot_input(
    totaltime_1 = totaltime_1,
    totaltime_2 = totaltime_2,
    area_pars_1 = area_pars_1 ,
    area_pars_2 = area_pars_2,
    island_ontogeny_1 = island_ontogeny_1,
    island_ontogeny_2 = island_ontogeny_2,
    sea_level_1 = sea_level_1,
    sea_level_2 = sea_level_2,
    resolution = resolution,
    overlay_sea_level = overlay_sea_level
  )
  island_ontogeny_1 <- DAISIE::translate_island_ontogeny(island_ontogeny_1)
  island_ontogeny_2 <- DAISIE::translate_island_ontogeny(island_ontogeny_2)
  sea_level_1 <- DAISIE::translate_sea_level(sea_level_1)
  sea_level_2 <- DAISIE::translate_sea_level(sea_level_2)


  if (overlay_sea_level) {

    area_pars_1_sea_level <- area_pars_1
    area_pars_2_sea_level <- area_pars_2

    sea_level_1 <- 0
    sea_level_2 <- 0
    area_pars_1$sea_level_amplitude <- 0
    area_pars_1$sea_level_frequency <- 0
    area_pars_1$island_gradient_angle <- 0
    area_pars_2$sea_level_amplitude <- 0
    area_pars_2$sea_level_frequency <- 0
    area_pars_2$island_gradient_angle <- 0
  }

  x_axis <- seq(0, totaltime_1, by = resolution)
  if (!is.null(area_pars_2)) {
    second_island_timepoints_abs_time <- seq(
      totaltime_1 - totaltime_2,
      totaltime_1,
      by = totaltime_2 / (length(x_axis) - 1)
    )
    second_island_timepoints_rel_time <- seq(
      0,
      totaltime_2,
      by = totaltime_2 / (length(x_axis) - 1)
    )
  }
  area_1 <- c()
  area_2 <- c()
  area_1 <- sapply(
    x_axis,
    FUN = DAISIE::island_area,
    area_pars_1,
    island_ontogeny_1,
    sea_level_1
  )
  area_2 <- sapply(
    second_island_timepoints_rel_time,
    FUN = DAISIE::island_area,
    area_pars_2,
    island_ontogeny_2,
    sea_level_2
  )

  island_area_time_1 <- data.frame(
    Area = area_1,
    Time = x_axis
  )
  island_area_time_2 <- data.frame(
    Area = area_2,
    Time = second_island_timepoints_abs_time
  )
  Time <- NULL; rm(Time)
  Area <- NULL; rm(Area)
  area_plot <- ggplot2::ggplot(
    data = island_area_time_1,
    ggplot2::aes(x = Time, y = Area)) +
    ggplot2::ggtitle("Variation of island area during simulation")  +
    ggplot2::theme_classic() +
    ggplot2::geom_line(size = 1.5, color = "black") +
    ggplot2::geom_line(data = island_area_time_2, size = 1.5, color = "black")

  if (overlay_sea_level) {
    area_1_sea_level <- c()
    area_2_sea_level <- c()
    sea_level_1 <- 1
    sea_level_2 <- 1

    area_1_sea_level <- sapply(
      x_axis,
      FUN = DAISIE::island_area,
      area_pars_1_sea_level,
      island_ontogeny_1,
      sea_level_1)
    area_2_sea_level <- sapply(
      second_island_timepoints_rel_time,
      FUN = DAISIE::island_area,
      area_pars_2_sea_level,
      island_ontogeny_2,
      sea_level_2
    )

    island_area_time_sea_level_1 <- data.frame(
      Area = area_1_sea_level,
      Time = x_axis
    )
    island_area_time_sea_level_2 <- data.frame(
      Area = area_2_sea_level,
      Time = second_island_timepoints_abs_time
    )

    area_plot <- area_plot +
      ggplot2::geom_line(data = island_area_time_sea_level_1,
                         color = "skyblue2",
                         size = 1.2,
                         alpha = 0.4) +
      ggplot2::geom_line(data = island_area_time_sea_level_2,
                         color = "coral",
                         size = 1.2,
                         alpha = 0.5)
  }


  return(area_plot)
}

#' Check if parameters for area plotting are valid
#'
#' Asserts all individual arguments for plotting are consistent. If any isn't,
#' a helpful error message is returned.
#' @inheritParams default_params_doc
#'
#' @seealso DAISIE_plot_areas
#' @author Pedro Neves, Joshua Lambert
#' @return Nothing, breaks with helpful error message if input is wrong.
check_area_plot_input <- function(totaltime_1,
                                  totaltime_2,
                                  area_pars_1,
                                  area_pars_2,
                                  island_ontogeny_1,
                                  island_ontogeny_2,
                                  sea_level_1,
                                  sea_level_2,
                                  resolution,
                                  overlay_sea_level) {
  testit::assert(is.numeric(totaltime_1))
  testit::assert(resolution > 0 && resolution < 1)
  testit::assert(DAISIE::is_island_ontogeny_input(island_ontogeny_1))
  testit::assert(DAISIE::is_sea_level_input(sea_level_1))
  island_ontogeny_1 <- DAISIE::translate_island_ontogeny(
    island_ontogeny = island_ontogeny_1
  )
  sea_level_1 <- DAISIE::translate_sea_level(
    sea_level = sea_level_1
  )
  testit::assert(DAISIE::are_area_pars(area_pars_1))

  testit::assert(resolution > 0 && resolution < 1,
                 fact = "Value of the resolution should be between 0 and 1.")
  testit::assert(overlay_sea_level &&
                   sea_level_1 != "const" &&
                   sea_level_2 != "const" &&
                   area_pars_1$sea_level_amplitude != 0 &&
                   area_pars_1$sea_level_frequency != 0 &&
                   area_pars_1$island_gradient_angle != 0 &&
                   area_pars_2$sea_level_amplitude != 0 &&
                   area_pars_2$sea_level_frequency != 0 &&
                   area_pars_2$island_gradient_angle != 0,
                   fact = "To overalay sea level curves,
                 sea level and valid sea level parameters must be specified")

  if (!is.null(area_pars_2)) {
    testit::assert(DAISIE::is_island_ontogeny_input(island_ontogeny_2))
    testit::assert(is.numeric(totaltime_2))
    testit::assert(DAISIE::is_sea_level_input(sea_level_2))
    island_ontogeny_2 <- DAISIE::translate_island_ontogeny(
      island_ontogeny = island_ontogeny_2
    )
    sea_level_2 <- DAISIE::translate_sea_level(
      sea_level = sea_level_2
    )
    testit::assert(DAISIE::are_area_pars(area_pars_2))
  }
}
