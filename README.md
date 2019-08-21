
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

The goal of drake-example is to provide a repo for developing a demo or
lesson for using the [drake](https://ropensci.github.io/drake/) package
for [R](https://www.r-project.org/) workflows.

A simple drake workflow:

1)  First — generate some data:

<!-- end list -->

``` r
library(here)
#> here() starts at /Users/shazlitt/dev/drake-example
source(here("generate_cohort_example.R"))
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

2)  Source the respective `.R` files which define the drake workflow:

<!-- end list -->

``` r
source(here("R/packages.R"))
source(here("R/functions.R"))       
source(here("R/plan.R"))    
```

3)  Run the plan & visualize progress:

<!-- end list -->

``` r
plan
#> # A tibble: 10 x 2
#>    target             command                                              
#>    <chr>              <expr>                                               
#>  1 studypop           readr::read_csv(file_in("data/studypop.csv"))       …
#>  2 dad_service_summa… readr::read_csv(file_in("data/dad_service_summary.cs…
#>  3 edu_data           readr::read_csv(file_in("data/edu_data.csv"))       …
#>  4 msp_service_summa… readr::read_csv(file_in("data/msp_service_summary.cs…
#>  5 pnet_data          readr::read_csv(file_in("data/pnet_data.csv"))      …
#>  6 merge1             studypop %>% left_join(dad_service_summary)         …
#>  7 merge2             merge1 %>% left_join(edu_data)                      …
#>  8 merge3             merge2 %>% left_join(msp_service_summary)           …
#>  9 merge4             merge3 %>% left_join(pnet_data)                     …
#> 10 export             readr::write_csv(merge4, file_out("out/final_merge.c…

config <- drake_config(plan)

make(plan)
#> All targets are already up to date.

vis_drake_graph(config)
```

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

All 3 steps above would typically be contained within a `make.R` file.

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
