
<!-- README.md is generated from README.Rmd. Please edit that file -->

# drake-example

<!-- badges: start -->

<a id="devex-badge" rel="Inspiration" href="https://github.com/BCDevExchange/assets/blob/master/README.md"><img alt="An idea being explored and shaped. Open for discussion, but may never go anywhere." style="border-width:0" src="https://assets.bcdevexchange.org/images/badges/inspiration.svg" title="An idea being explored and shaped. Open for discussion, but may never go anywhere." /></a>
<!-- badges: end -->

The goal of drake-example is to provide a repo for developing a lesson
or lecture surrounding drake-based R workflows.

A simple drake workflow outlined (WIP):

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
vis_drake_graph(config)
```

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r


make(plan)
#> target export

vis_drake_graph(config)
```

![](README_files/figure-gfm/unnamed-chunk-3-2.png)<!-- -->

All 3 steps would typically be contained within a `make.R` file.
