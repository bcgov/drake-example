
<!--
Copyright 2018 Province of British Columbia

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
-->

# drake-example

<!-- badges: start -->

<a id="devex-badge" rel="Inspiration" href="https://github.com/BCDevExchange/assets/blob/master/README.md"><img alt="An idea being explored and shaped. Open for discussion, but may never go anywhere." style="border-width:0" src="https://assets.bcdevexchange.org/images/badges/inspiration.svg" title="An idea being explored and shaped. Open for discussion, but may never go anywhere." /></a>
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
<!-- badges: end -->

## Install dependencies

``` r
remotes::install_deps(dependencies = TRUE, build = FALSE)
```

The goal of drake-example is to provide a template repo for using the
[drake](https://ropensci.github.io/drake/) package for
[R](https://www.r-project.org/) workflows. The repo is also tries to
utilize R compendiums to manage dependencies and enables the suite
package management tools. Here is the current directory of files for
this type of project:

## File Structures

    #> .
    #> +-- code
    #> |   +-- 01-data
    #> |   |   \-- data.R
    #> |   \-- packages.R
    #> +-- CODE_OF_CONDUCT.md
    #> +-- CONTRIBUTING.md
    #> +-- data-raw
    #> |   +-- birth-year.csv
    #> |   +-- generate_cohort_example.R
    #> |   +-- names.csv
    #> |   +-- other-traits.csv
    #> |   +-- physical-traits.csv
    #> |   \-- place-characteristics.csv
    #> +-- DESCRIPTION
    #> +-- drake-example.Rproj
    #> +-- exec_drake.R
    #> +-- inst
    #> +-- LICENSE
    #> +-- man
    #> +-- NAMESPACE
    #> +-- R
    #> |   +-- functions.R
    #> |   \-- plan.R
    #> +-- README.md
    #> +-- README.Rmd
    #> \-- _drake.R

## Data

Fake data is created and stored in the `data-raw` directory.

## Workflows

  - Store re-useable functions in the `R/` directories.
    `devtools::load_all()` makes them available during your R session
    like a package.
  - Write analysis code in the `code/` directory as normal R code.
  - Use `drake::code_to_plan()` to bring those R scripts into your drake
    plan. In this example, those actions are stored in `_drake.R`
  - The `exec_drake.R` file is the main control file for the project.
    The most important element of this script is the `drake::make()`
    function. This file also sources all other main files.

## Inspiration

This example draws from the following amazing resources: -
<https://books.ropensci.org/drake/> -
<https://github.com/pat-s/pathogen-modeling> -
<https://github.com/benmarwick/rrtools>

### Getting Help or Reporting an Issue

To report bugs/issues/feature requests, please file an
[issue](https://github.com/bcgov/drake-example/issues/).

### How to Contribute

If you would like to contribute to the package, please see our
[CONTRIBUTING](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.

### License

Copyright 2019 Province of British Columbia

Licensed under the Apache License, Version 2.0 (the “License”); you may
not use this file except in compliance with the License. You may obtain
a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an “AS IS” BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

-----

*This project was created using the
[bcgovr](https://github.com/bcgov/bcgovr) package.*
