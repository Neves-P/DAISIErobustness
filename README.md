# DAISIErobustness


<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/Neves-P/DAISIErobustness)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3897237.svg)](https://doi.org/10.5281/zenodo.3897237)
Branch|[Travis](https://travis-ci.org)|[AppVeyor](https://www.appveyor.com/)|[Codecov](https://www.codecov.io)
---|---|---|---
`master`|[![Build Status](https://travis-ci.org/Neves-P/DAISIErobustness.svg?branch=master)](https://travis-ci.org/Neves-P/DAISIErobustness)|[![AppVeyor](https://ci.appveyor.com/api/projects/status/github/Neves-P/DAISIErobustness?branch=master&svg=true)](https://ci.appveyor.com/project/Neves-P/DAISIErobustness)|[![codecov.io](https://codecov.io/github/Neves-P/DAISIErobustness/coverage.svg?branch=master)](https://codecov.io/github/Neves-P/DAISIErobustness/branch/master)
`develop`|[![Build Status](https://travis-ci.org/Neves-P/DAISIErobustness.svg?branch=develop)](https://travis-ci.org/Neves-P/DAISIErobustness)|[![AppVeyor](https://ci.appveyor.com/api/projects/status/github/Neves-P/DAISIErobustness?branch=develop&svg=true)](https://ci.appveyor.com/project/Neves-P/DAISIErobustness)|[![codecov.io](https://codecov.io/github/Neves-P/DAISIErobustness/coverage.svg?branch=develop)](https://codecov.io/github/Neves-P/DAISIErobustness/branch/develop)
<!-- badges: end -->

The goal of DAISIErobustness is to run robustness studies using the island biogeography model DAISIE. For the development of the geodynamical and traits models currently in use by DAISIErobustness, see the [DAISIE package v3.0.0](https://github.com/rsetienne/DAISIE/commit/dd54db21a841a182fa6b44796fe20ea22916781a), currently at the `develop` branch.

# Installation

DAISIErobustness can easily be installed from GitHub by running the following code:
``` r
install.packages("remotes")
remotes::install_github("Neves-P/DAISIErobustness")
```

# Pipeline usage

DAISIErobustness consists of a pipeline that relies on DAISIE simulations and inference code. For an extended description of the pipeline and its usage, see [here](https://github.com/Neves-P/DAISIErobustness/wiki).

# Support/Questions
For feature requests or bug-reports, please submit an [issue](https://github.com/Neves-P/DAISIErobustness/issues/new).

For other matters, contact the authors: [@Neves-P](https://github.com/Neves-P), [@joshwlambert](https://github.com/joshwlambert) or [@xieshu95](https://github.com/xieshu95).
