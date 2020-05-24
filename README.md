# DAISIErobustness

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: start -->
Branch|[Travis](https://travis-ci.org)|[AppVeyor](https://www.appveyor.com/)|[Codecov](https://www.codecov.io)
---|---|---|---
`master`|[![Build Status](https://travis-ci.org/Neves-P/DAISIErobustness.svg?branch=master)](https://travis-ci.org/Neves-P/DAISIErobustness)|[![AppVeyor](https://ci.appveyor.com/api/projects/status/github/Neves-P/DAISIErobustness?branch=master&svg=true)](https://ci.appveyor.com/project/Neves-P/DAISIErobustness)|[![codecov.io](https://codecov.io/github/Neves-P/DAISIErobustness/coverage.svg?branch=master)](https://codecov.io/github/Neves-P/DAISIErobustness/branch/master)
`develop`|[![Build Status](https://travis-ci.org/Neves-P/DAISIErobustness.svg?branch=develop)](https://travis-ci.org/Neves-P/DAISIErobustness)|[![AppVeyor](https://ci.appveyor.com/api/projects/status/github/Neves-P/DAISIErobustness?branch=develop&svg=true)](https://ci.appveyor.com/project/Neves-P/DAISIErobustness)|[![codecov.io](https://codecov.io/github/Neves-P/DAISIErobustness/coverage.svg?branch=develop)](https://codecov.io/github/Neves-P/DAISIErobustness/branch/develop)
`trait`|[![Build Status](https://travis-ci.org/Neves-P/DAISIErobustness.svg?branch=trait)](https://travis-ci.org/Neves-P/DAISIErobustness)|[![AppVeyor](https://ci.appveyor.com/api/projects/status/github/Neves-P/DAISIErobustness?branch=trait&svg=true)](https://ci.appveyor.com/project/Neves-P/DAISIErobustness)|[![codecov.io](https://codecov.io/github/Neves-P/DAISIErobustness/coverage.svg?branch=trait)](https://codecov.io/github/Neves-P/DAISIErobustness/branch/trait)
`geodynamics`|[![Build Status](https://travis-ci.org/Neves-P/DAISIErobustness.svg?branch=geodynamics)](https://travis-ci.org/Neves-P/DAISIErobustness)|[![AppVeyor](https://ci.appveyor.com/api/projects/status/github/Neves-P/DAISIErobustness?branch=geodynamics&svg=true)](https://ci.appveyor.com/project/Neves-P/DAISIErobustness)|[![codecov.io](https://codecov.io/github/Neves-P/DAISIErobustness/coverage.svg?branch=geodynamics)](https://codecov.io/github/Neves-P/DAISIErobustness/branch/geodynamics)
<!-- badges: end -->

The goal of DAISIErobustness is to run robustness studies using the island biogeography model DAISIE. For the development of the geodynamical and traits models currently in use by DAISIErobustness, see the [geodynamics](https://github.com/rsetienne/DAISIE/tree/geodynamics) and [trait](https://github.com/rsetienne/DAISIE/tree/trait) branches of DAISIE.

# Installation

DAISIErobustness can easily be install from GitHub by running the following code:
``` r
install.packages("remotes")
remotes::install_github("Neves-P/DAISIErobustness")
```

# Pipeline usage

DAISIErobustness consists of a pipeline that relies on DAISIE simulations and inference code. For an extended description of the pipeline and its usage, see [here](https://github.com/Neves-P/DAISIErobustness/blob/master/doc/pipeline_outline.md).

# Support/Questions
For feature requests or bug-reports, please submit an [issue](https://github.com/Neves-P/DAISIErobustness/issues/new).

For other matters, contact the authors: [@Neves-P](https://github.com/Neves-P), [@joshwlambert](https://github.com/joshwlambert) or [@xieshu95](https://github.com/xieshu95).
