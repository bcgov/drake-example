# Copyright 2019 Province of British Columbia
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

names <- read_csv("data-raw/names.csv")
physical_traits <- read_csv("data-raw/physical-traits.csv")
other_traits <- read_csv("data-raw/other-traits.csv")
birth_year <- read_csv("data-raw/birth-year.csv")
places <- read_csv("data-raw/place-characteristics.csv")


rep_names <- rep(unique(names$name), 1E3)

fst_data <- target(data.frame(name = rep_names, y = runif(length(rep_names))), format = "fst")

raw_data <- data.frame(name = rep_names, y = runif(length(rep_names)))
