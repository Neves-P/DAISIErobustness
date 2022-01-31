#' Plots island area function(s) through time
#'
#' Plots area functions through time. If only one set of area and/or sea-level
#' parameters are given, then only one area is plotted.
#' @inheritParams default_params_doc
#'
#' @return a plot with the area size through time
#' @author Pedro Neves, Joshua Lambert
#' @examples
#'
#' param_space <- load_param_space("oceanic_ontogeny_sea_level")
#'
#' area_pars_1 <- DAISIE::create_area_pars(
#'   max_area = param_space$max_area[nrow(param_space) / 2 + 1],
#'   current_area = param_space$current_area[nrow(param_space) / 2 + 1],
#'   proportional_peak_t = param_space$peak_time[nrow(param_space) / 2 + 1],
#'   total_island_age = param_space$total_island_age[nrow(param_space) / 2 + 1],
#'   sea_level_amplitude = param_space$sea_level_amplitude[nrow(param_space) / 2 + 1],
#'   sea_level_frequency = param_space$sea_level_frequency[nrow(param_space) / 2 + 1],
#'   island_gradient_angle = param_space$island_gradient_angle[nrow(param_space) / 2 + 1]
#' )
#'
#' area_pars_2 <- DAISIE::create_area_pars(
#'   max_area = param_space$max_area[1],
#'   current_area = param_space$current_area[1],
#'   proportional_peak_t = param_space$peak_time[1],
#'   total_island_age = param_space$total_island_age[1],
#'   sea_level_amplitude = param_space$sea_level_amplitude[1],
#'   sea_level_frequency = param_space$sea_level_frequency[1],
#'   island_gradient_angle = param_space$island_gradient_angle[1]
#' )
#'
#' island_ontogeny_1 <- "beta"
#' island_ontogeny_2 <- "beta"
#' sea_level_1 <- "sine"
#' sea_level_2 <- "sine"
#' resolution <- 0.001
#' overlay_sea_level_ontogeny <- TRUE
#' overlay_sea_level <- TRUE
#' totaltime_1 <- param_space$time[nrow(param_space)]
#' totaltime_2 <- param_space$time[1]
#'
#' plot_areas(
#'   totaltime_1 = totaltime_1,
#'   totaltime_2 = totaltime_2,
#'   area_pars_1 = area_pars_1,
#'   area_pars_2 = area_pars_2,
#'   island_ontogeny_1 = island_ontogeny_1,
#'   island_ontogeny_2 = island_ontogeny_2,
#'   sea_level_1 = sea_level_1,
#'   sea_level_2 = sea_level_2,
#'   resolution = resolution,
#'   overlay_sea_level_ontogeny = overlay_sea_level_ontogeny,
#'   overlay_sea_level = overlay_sea_level
#' )
plot_areas <- function(totaltime_1,
                       totaltime_2 = NULL,
                       area_pars_1,
                       area_pars_2 = NULL,
                       island_ontogeny_1 = "beta",
                       island_ontogeny_2 = NULL,
                       sea_level_1 = "const",
                       sea_level_2 = NULL,
                       resolution = 0.001,
                       overlay_sea_level_ontogeny = FALSE,
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
    overlay_sea_level_ontogeny = overlay_sea_level_ontogeny
  )
  island_ontogeny_1 <- DAISIE:::translate_island_ontogeny(island_ontogeny_1)
  island_ontogeny_2 <- DAISIE:::translate_island_ontogeny(island_ontogeny_2)
  sea_level_1 <- DAISIE:::translate_sea_level(sea_level_1)
  sea_level_2 <- DAISIE:::translate_sea_level(sea_level_2)


  if (overlay_sea_level_ontogeny || overlay_sea_level) {

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
  area_1_peak <- DAISIE:::calc_peak(
    total_time = totaltime_1,
    area_pars = area_pars_1
  )
  area_2_peak <- DAISIE:::calc_peak(
    total_time = totaltime_2,
    area_pars = area_pars_2
  )
  area_1 <- sapply(
    x_axis,
    FUN = DAISIE:::island_area,
    totaltime = totaltime_1,
    area_pars = area_pars_1,
    peak = area_1_peak,
    island_ontogeny = island_ontogeny_1,
    sea_level = sea_level_1
  )
  area_2 <- sapply(
    second_island_timepoints_rel_time,
    FUN = DAISIE:::island_area,
    totaltime = totaltime_1,
    area_pars = area_pars_2,
    peak = area_2_peak,
    island_ontogeny = island_ontogeny_2,
    sea_level = sea_level_2
  )

  island_area_time_1 <- data.frame(
    Area = area_1,
    Time = totaltime_1 - x_axis
  )
  island_area_time_2 <- data.frame(
    Area = area_2,
    Time = totaltime_1 - second_island_timepoints_abs_time
  )
  Time <- NULL; rm(Time)
  Area <- NULL; rm(Area)
  area_plot <- ggplot2::ggplot(
    data = island_area_time_1,
    ggplot2::aes(x = Time, y = Area)) +
    ggplot2::scale_x_reverse() +
    # ggplot2::ggtitle("Variation of island area during simulation")  +
    ggplot2::theme_bw() +
    ggplot2::geom_line(size = 1.2, color = "black") +
    ggplot2::geom_line(data = island_area_time_2, size = 1.2, color = "black") +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 10)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 10)) +
    ggplot2::xlab("Time (mya)") + ggplot2::ylab(bquote('Area '~(km^2)))


  if (overlay_sea_level_ontogeny) {
    area_1_sea_level_ontogeny <- c()
    area_2_sea_level_ontogeny <- c()
    sea_level_1 <- 1
    sea_level_2 <- 1

    area_1_sea_level_ontogeny <- sapply(
      x_axis,
      FUN = DAISIE:::island_area,
      totaltime = totaltime_1,
      area_pars = area_pars_1_sea_level,
      peak = area_1_peak,
      island_ontogeny = island_ontogeny_1,
      sea_level = sea_level_1
    )
    area_2_sea_level_ontogeny <- sapply(
      second_island_timepoints_rel_time,
      FUN = DAISIE:::island_area,
      totaltime = totaltime_1,
      area_pars = area_pars_2_sea_level,
      peak = area_2_peak,
      island_ontogeny = island_ontogeny_2,
      sea_level = sea_level_2
    )

    island_area_time_sea_level_ontogeny_1 <- data.frame(
      Area = area_1_sea_level_ontogeny,
      Time = totaltime_1 - x_axis
    )
    island_area_time_sea_level_ontogeny_2 <- data.frame(
      Area = area_2_sea_level_ontogeny,
      Time = totaltime_1 - second_island_timepoints_abs_time
    )

    area_plot <- area_plot +
      ggplot2::geom_line(data = island_area_time_sea_level_ontogeny_1,
                         color = viridis::viridis(1),
                         size = 0.55,
                         alpha = 0.8) +
      ggplot2::geom_line(data = island_area_time_sea_level_ontogeny_2,
                         color = viridis::viridis(1),
                         size = 0.55,
                         alpha = 0.8) +
      ggplot2::geom_line(data = island_area_time_1, size = 1.2, color = "black") +
      ggplot2::geom_line(data = island_area_time_2, size = 1.2, color = "black")

    if (overlay_sea_level) {
      area_1_sea_level <- c()
      area_2_sea_level <- c()
      sea_level_1 <- 1
      sea_level_2 <- 1
      island_ontogeny_1 <- 0
      island_ontogeny_2 <- 0

      area_1_sea_level <- sapply(
        x_axis,
        FUN = DAISIE:::island_area,
        totaltime = totaltime_1,
        area_pars = area_pars_1,
        peak = area_1_peak,
        island_ontogeny = island_ontogeny_1,
        sea_level = sea_level_1
      )
      area_2_sea_level <- sapply(
        second_island_timepoints_rel_time,
        FUN = DAISIE:::island_area,
        totaltime = totaltime_1,
        area_pars = area_pars_2,
        peak = area_2_peak,
        island_ontogeny = island_ontogeny_2,
        sea_level = sea_level_2
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
                           color = viridis::viridis(1),
                           size = 0.55,
                           alpha = 0.8) +
        ggplot2::geom_line(data = island_area_time_sea_level_2,
                           color = viridis::viridis(1),
                           size = 0.55,
                           alpha = 0.8)
    }


  }
  return(area_plot)
}

#' Check if parameters for area plotting are valid
#'
#' Asserts all individual arguments for plotting are consistent. If any isn't,
#' a helpful error message is returned.
#' @inheritParams default_params_doc
#'
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
                                  overlay_sea_level_ontogeny) {
  testit::assert(is.numeric(totaltime_1))
  testit::assert(resolution > 0 && resolution < 1)
  testit::assert(DAISIE:::is_island_ontogeny_input(island_ontogeny_1))
  testit::assert(DAISIE:::is_sea_level_input(sea_level_1))
  island_ontogeny_1 <- DAISIE:::translate_island_ontogeny(
    island_ontogeny = island_ontogeny_1
  )
  sea_level_1 <- DAISIE:::translate_sea_level(
    sea_level = sea_level_1
  )
  testit::assert(DAISIE::are_area_pars(area_pars_1))

  testit::assert(resolution > 0 && resolution < 1,
                 fact = "Value of the resolution should be between 0 and 1.")
  testit::assert(overlay_sea_level_ontogeny &&
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
    testit::assert(DAISIE:::is_island_ontogeny_input(island_ontogeny_2))
    testit::assert(is.numeric(totaltime_2))
    testit::assert(DAISIE:::is_sea_level_input(sea_level_2))
    island_ontogeny_2 <- DAISIE:::translate_island_ontogeny(
      island_ontogeny = island_ontogeny_2
    )
    sea_level_2 <- DAISIE:::translate_sea_level(
      sea_level = sea_level_2
    )
    testit::assert(DAISIE:::are_area_pars(area_pars_2))
  }
}
