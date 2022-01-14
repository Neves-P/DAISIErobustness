#' @name oceanic_ontogeny_cs
#' @title Parameter space of the oceanic ontogeny clade-specific
#' diversity-dependent analysis
#' @docType data
#'
#' @description A dataset containing the DAISIE parameters for 256 parameter
#' sets.
#'
#' @format A data frame with 256 rows and 22 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x}{the exponent for calculating extinction rate}
#'   \item{d}{the scaling parameter for exponent for calculating
#'   cladogenesis rate}
#'   \item{island_ontogeny}{String describing the type of island ontogeny. Can
#'   be "const", "beta" for a beta function describing area through time}
#'   \item{sea_level}{String describing the type of sea level. Can be "const" or
#'   "sine" for a sine function describing area through time}
#'   \item{max_area}{maximum area}
#'   \item{current_area}{current area}
#'   \item{peak_time}{value from 0 to 1 indicating where in the island's history
#'   the peak area is achieved}
#'   \item{total_island_age}{total island age}
#'   \item{sea_level_amplitude}{amplitude of area fluctuation from sea level}
#'   \item{sea_level_frequency}{frequency of sine wave of area change from sea
#'   level}
#'   \item{island_gradient_angle}{angle of the slope of the island}
#'   \item{extcutoff}{Numeric with the cutoff for the the maximum extinction
#'   rate preventing it from being too large and slowing down simulation}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name oceanic_ontogeny_di
#' @title Parameter space of the oceanic ontogeny diversity-independent analysis
#' @docType data
#'
#' @description A dataset containing the DAISIE parameters for 128 parameter
#' sets.
#'
#' @format A data frame with 128 rows and 22 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x}{the exponent for calculating extinction rate}
#'   \item{d}{the scaling parameter for exponent for calculating
#'   cladogenesis rate}
#'   \item{island_ontogeny}{String describing the type of island ontogeny. Can
#'   be "const", "beta" for a beta function describing area through time}
#'   \item{sea_level}{String describing the type of sea level. Can be "const" or
#'   "sine" for a sine function describing area through time}
#'   \item{max_area}{maximum area}
#'   \item{current_area}{current area}
#'   \item{peak_time}{value from 0 to 1 indicating where in the island's history
#'   the peak area is achieved}
#'   \item{total_island_age}{total island age}
#'   \item{sea_level_amplitude}{amplitude of area fluctuation from sea level}
#'   \item{sea_level_frequency}{frequency of sine wave of area change from sea
#'   level}
#'   \item{island_gradient_angle}{angle of the slope of the island}
#'   \item{extcutoff}{Numeric with the cutoff for the the maximum extinction
#'   rate preventing it from being too large and slowing down simulation}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name oceanic_ontogeny_iw
#' @title Parameter space of the oceanic ontogeny island-wide
#' diversity-dependent analysis
#'
#' @description A dataset containing the DAISIE parameters for 256 parameter
#' sets.
#'
#' @format A data frame with 256 rows and 22 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x}{the exponent for calculating extinction rate}
#'   \item{d}{the scaling parameter for exponent for calculating
#'   cladogenesis rate}
#'   \item{island_ontogeny}{String describing the type of island ontogeny. Can
#'   be "const", "beta" for a beta function describing area through time}
#'   \item{sea_level}{String describing the type of sea level. Can be "const" or
#'   "sine" for a sine function describing area through time}
#'   \item{max_area}{maximum area}
#'   \item{current_area}{current area}
#'   \item{peak_time}{value from 0 to 1 indicating where in the island's history
#'   the peak area is achieved}
#'   \item{total_island_age}{total island age}
#'   \item{sea_level_amplitude}{amplitude of area fluctuation from sea level}
#'   \item{sea_level_frequency}{frequency of sine wave of area change from sea
#'   level}
#'   \item{island_gradient_angle}{angle of the slope of the island}
#'   \item{extcutoff}{Numeric with the cutoff for the the maximum extinction
#'   rate preventing it from being too large and slowing down simulation}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name oceanic_sea_level_cs
#' @title Parameter space of the oceanic sea-level clade-specific
#' diversity-dependent analysis
#'
#' @description A dataset containing the DAISIE parameters for 512 parameter
#' sets.
#'
#' @format A data frame with 512 rows and 22 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x}{the exponent for calculating extinction rate}
#'   \item{d}{the scaling parameter for exponent for calculating
#'   cladogenesis rate}
#'   \item{island_ontogeny}{String describing the type of island ontogeny. Can
#'   be "const", "beta" for a beta function describing area through time}
#'   \item{sea_level}{String describing the type of sea level. Can be "const" or
#'   "sine" for a sine function describing area through time}
#'   \item{max_area}{maximum area}
#'   \item{current_area}{current area}
#'   \item{peak_time}{value from 0 to 1 indicating where in the island's history
#'   the peak area is achieved}
#'   \item{total_island_age}{total island age}
#'   \item{sea_level_amplitude}{amplitude of area fluctuation from sea level}
#'   \item{sea_level_frequency}{frequency of sine wave of area change from sea
#'   level}
#'   \item{island_gradient_angle}{angle of the slope of the island}
#'   \item{extcutoff}{Numeric with the cutoff for the the maximum extinction
#'   rate preventing it from being too large and slowing down simulation}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name oceanic_sea_level_di
#' @title Parameter space of the oceanic sea-level diversity-independent
#' analysis
#'
#' @description A dataset containing the DAISIE parameters for 256 parameter
#' sets.
#'
#' @format A data frame with 256 rows and 22 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x}{the exponent for calculating extinction rate}
#'   \item{d}{the scaling parameter for exponent for calculating
#'   cladogenesis rate}
#'   \item{island_ontogeny}{String describing the type of island ontogeny. Can
#'   be "const", "beta" for a beta function describing area through time}
#'   \item{sea_level}{String describing the type of sea level. Can be "const" or
#'   "sine" for a sine function describing area through time}
#'   \item{max_area}{maximum area}
#'   \item{current_area}{current area}
#'   \item{peak_time}{value from 0 to 1 indicating where in the island's history
#'   the peak area is achieved}
#'   \item{total_island_age}{total island age}
#'   \item{sea_level_amplitude}{amplitude of area fluctuation from sea level}
#'   \item{sea_level_frequency}{frequency of sine wave of area change from sea
#'   level}
#'   \item{island_gradient_angle}{angle of the slope of the island}
#'   \item{extcutoff}{Numeric with the cutoff for the the maximum extinction
#'   rate preventing it from being too large and slowing down simulation}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name oceanic_sea_level_iw
#' @title Parameter space of the oceanic sea-level island-wide
#' diversity-dependent analysis
#'
#' @description A dataset containing the DAISIE parameters for 512 parameter
#' sets.
#'
#' @format A data frame with 512 rows and 22 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x}{the exponent for calculating extinction rate}
#'   \item{d}{the scaling parameter for exponent for calculating
#'   cladogenesis rate}
#'   \item{island_ontogeny}{String describing the type of island ontogeny. Can
#'   be "const", "beta" for a beta function describing area through time}
#'   \item{sea_level}{String describing the type of sea level. Can be "const" or
#'   "sine" for a sine function describing area through time}
#'   \item{max_area}{maximum area}
#'   \item{current_area}{current area}
#'   \item{peak_time}{value from 0 to 1 indicating where in the island's history
#'   the peak area is achieved}
#'   \item{total_island_age}{total island age}
#'   \item{sea_level_amplitude}{amplitude of area fluctuation from sea level}
#'   \item{sea_level_frequency}{frequency of sine wave of area change from sea
#'   level}
#'   \item{island_gradient_angle}{angle of the slope of the island}
#'   \item{extcutoff}{Numeric with the cutoff for the the maximum extinction
#'   rate preventing it from being too large and slowing down simulation}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name oceanic_ontogeny_sea_level_cs
#' @title Parameter space of the oceanic ontogeny sea-level clade-specific
#' diversity-dependent analysis
#'
#' @description A dataset containing the DAISIE parameters for 512 parameter
#' sets.
#'
#' @format A data frame with 512 rows and 22 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x}{the exponent for calculating extinction rate}
#'   \item{d}{the scaling parameter for exponent for calculating
#'   cladogenesis rate}
#'   \item{island_ontogeny}{String describing the type of island ontogeny. Can
#'   be "const", "beta" for a beta function describing area through time}
#'   \item{sea_level}{String describing the type of sea level. Can be "const" or
#'   "sine" for a sine function describing area through time}
#'   \item{max_area}{maximum area}
#'   \item{current_area}{current area}
#'   \item{peak_time}{value from 0 to 1 indicating where in the island's history
#'   the peak area is achieved}
#'   \item{total_island_age}{total island age}
#'   \item{sea_level_amplitude}{amplitude of area fluctuation from sea level}
#'   \item{sea_level_frequency}{frequency of sine wave of area change from sea
#'   level}
#'   \item{island_gradient_angle}{angle of the slope of the island}
#'   \item{extcutoff}{Numeric with the cutoff for the the maximum extinction
#'   rate preventing it from being too large and slowing down simulation}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name oceanic_ontogeny_sea_level_di
#' @title Parameter space of the oceanic ontogeny sea-level
#' diversity-independent analysis
#'
#' @description A dataset containing the DAISIE parameters for 256 parameter
#' sets.
#'
#' @format A data frame with 256 rows and 22 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x}{the exponent for calculating extinction rate}
#'   \item{d}{the scaling parameter for exponent for calculating
#'   cladogenesis rate}
#'   \item{island_ontogeny}{String describing the type of island ontogeny. Can
#'   be "const", "beta" for a beta function describing area through time}
#'   \item{sea_level}{String describing the type of sea level. Can be "const" or
#'   "sine" for a sine function describing area through time}
#'   \item{max_area}{maximum area}
#'   \item{current_area}{current area}
#'   \item{peak_time}{value from 0 to 1 indicating where in the island's history
#'   the peak area is achieved}
#'   \item{total_island_age}{total island age}
#'   \item{sea_level_amplitude}{amplitude of area fluctuation from sea level}
#'   \item{sea_level_frequency}{frequency of sine wave of area change from sea
#'   level}
#'   \item{island_gradient_angle}{angle of the slope of the island}
#'   \item{extcutoff}{Numeric with the cutoff for the the maximum extinction
#'   rate preventing it from being too large and slowing down simulation}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name oceanic_ontogeny_sea_level_iw
#' @title Parameter space of the oceanic ontogeny sea-level island-wide
#' diversity-dependent analysis
#'
#' @description A dataset containing the DAISIE parameters for 512 parameter
#' sets.
#'
#' @format A data frame with 512 rows and 22 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x}{the exponent for calculating extinction rate}
#'   \item{d}{the scaling parameter for exponent for calculating
#'   cladogenesis rate}
#'   \item{island_ontogeny}{String describing the type of island ontogeny. Can
#'   be "const", "beta" for a beta function describing area through time}
#'   \item{sea_level}{String describing the type of sea level. Can be "const" or
#'   "sine" for a sine function describing area through time}
#'   \item{max_area}{maximum area}
#'   \item{current_area}{current area}
#'   \item{peak_time}{value from 0 to 1 indicating where in the island's history
#'   the peak area is achieved}
#'   \item{total_island_age}{total island age}
#'   \item{sea_level_amplitude}{amplitude of area fluctuation from sea level}
#'   \item{sea_level_frequency}{frequency of sine wave of area change from sea
#'   level}
#'   \item{island_gradient_angle}{angle of the slope of the island}
#'   \item{extcutoff}{Numeric with the cutoff for the the maximum extinction
#'   rate preventing it from being too large and slowing down simulation}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name continental_cs
#' @title Parameter space of the continental clade-specific diversity-dependent
#' analysis
#'
#' @description A dataset containing the DAISIE parameters for 384 parameter
#' sets.
#'
#' @format A data frame with 384 rows and 10 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name continental_di
#' @title Parameter space of the continental diversity-independent analysis
#'
#' @description A dataset containing the DAISIE parameters for 192 parameter
#' sets.
#'
#' @format A data frame with 192 rows and 10 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name continental_iw
#' @title Parameter space of the continental island-wide diversity-dependent
#' analysis
#'
#' @description A dataset containing the DAISIE parameters for 384 parameter
#' sets.
#'
#' @format A data frame with 384 rows and 10 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#' }
NULL

#' @name continental_land_bridge_cs
#' @title Parameter space of the continental land-bridge clade-specific
#' diversity-dependent analysis
#'
#' @description A dataset containing the DAISIE parameters for 128 parameter
#' sets.
#'
#' @format A data frame with 128 rows and 16 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac_1}{lambda^c (cladogenesis rate)}
#'   \item{mu_1}{mu (extinction rate)}
#'   \item{K_1}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam_1}{gamma (immigration rate)}
#'   \item{laa_1}{lambda^a (anagenesis rate)}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{shift_times}{Numeric vector specifying when the rate shifts occur
#'   before the present}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#'   \item{lac_2}{lambda^c (cladogenesis rate) for rate set 2 in rate shift
#'   model}
#'   \item{mu_2}{mu (extinction rate) for rate set 2 in rate shift model}
#'   \item{K_2}{K (K (carrying capacity) for rate set 2 in rate shift model, set
#'   K=Inf for diversity independence}
#'   \item{gam_2}{gamma (immigration rate) for rate set 2 in rate shift model}
#'   \item{laa_2}{ambda^a (anagenesis rate) for rate set 2 in rate shift model}
#' }
NULL

#' @name continental_land_bridge_di
#' @title Parameter space of the continental land-bridge diversity-independent
#' analysis
#'
#' @description A dataset containing the DAISIE parameters for 128 parameter
#' sets.
#'
#' @format A data frame with 128 rows and 16 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac_1}{lambda^c (cladogenesis rate)}
#'   \item{mu_1}{mu (extinction rate)}
#'   \item{K_1}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam_1}{gamma (immigration rate)}
#'   \item{laa_1}{lambda^a (anagenesis rate)}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{shift_times}{Numeric vector specifying when the rate shifts occur
#'   before the present}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#'   \item{lac_2}{lambda^c (cladogenesis rate) for rate set 2 in rate shift
#'   model}
#'   \item{mu_2}{mu (extinction rate) for rate set 2 in rate shift model}
#'   \item{K_2}{K (K (carrying capacity) for rate set 2 in rate shift model, set
#'   K=Inf for diversity independence}
#'   \item{gam_2}{gamma (immigration rate) for rate set 2 in rate shift model}
#'   \item{laa_2}{ambda^a (anagenesis rate) for rate set 2 in rate shift model}
#' }
NULL

#' @name continental_land_bridge_iw
#' @title Parameter space of the continental land-bridge island-wide
#' diversity-dependent analysis
#'
#' @description A dataset containing the DAISIE parameters for 128 parameter
#' sets.
#'
#' @format A data frame with 128 rows and 16 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{lac_1}{lambda^c (cladogenesis rate)}
#'   \item{mu_1}{mu (extinction rate)}
#'   \item{K_1}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam_1}{gamma (immigration rate)}
#'   \item{laa_1}{lambda^a (anagenesis rate)}
#'   \item{x_s}{the probability of sampling a species from the mainland}
#'   \item{x_nonend}{the probability of the species sampled from the mainland
#'   being nonendemic}
#'   \item{shift_times}{Numeric vector specifying when the rate shifts occur
#'   before the present}
#'   \item{divdepmodel}{Option divdepmodel = 'CS' runs a model with
#'   clade-specific carrying capacity, where diversity-dependence operates only
#'   within single clades, i.e. only among species originating from the same
#'   mainland colonist. Option divdepmodel = 'IW' runs a model with island-wide
#'   carrying capacity, where diversity-dependence operates within and among
#'   clades.}
#'   \item{lac_2}{lambda^c (cladogenesis rate) for rate set 2 in rate shift
#'   model}
#'   \item{mu_2}{mu (extinction rate) for rate set 2 in rate shift model}
#'   \item{K_2}{K (K (carrying capacity) for rate set 2 in rate shift model, set
#'   K=Inf for diversity independence}
#'   \item{gam_2}{gamma (immigration rate) for rate set 2 in rate shift model}
#'   \item{laa_2}{ambda^a (anagenesis rate) for rate set 2 in rate shift model}
#' }
NULL

#' @name trait_CES
#' @title Parameter space of the trait-dependent analysis
#'
#' @description A dataset containing the DAISIE parameters for 1664 parameter
#' sets.
#'
#' @format A data frame with 1664 rows and 14 variables:
#' \describe{
#'   \item{time}{Numeric defining the length of the simulation in time units}
#'   \item{M}{Numeric defining the size of mainland pool, i.e. the number of
#'   species that can potentially colonize the island}
#'   \item{M}{Numeric defining the size of mainland pool of species with trait
#'   2}
#'   \item{lac}{lambda^c (cladogenesis rate)}
#'   \item{mu}{mu (extinction rate)}
#'   \item{K}{K (carrying capacity), set K=Inf for diversity independence}
#'   \item{gam}{gamma (immigration rate)}
#'   \item{laa}{lambda^a (anagenesis rate)}
#'   \item{trans}{transition rate of trait state 1 to trait states 2}
#'   \item{trans2}{transition rate of trait state 2 to trait state 1}
#'   \item{lac2}{lambda^c (cladogenesis rate) of species with trait state 2}
#'   \item{mu2}{mu (extinction rate) of species with trait state 2}
#'   \item{gam2}{gamma (immigration rate) of species with trait state 2}
#'   \item{laa2}{lambda^a (anagenesis rate) of species with trait state 2}
#' }
NULL
