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


## Generate some related tables to demonstrate a merging process
library(dplyr)
library(readr)
library(glue)

data_path <- 'data-raw'

if (!dir.exists(data_path)) dir.create(data_path)

starwars %>% 
  select(name, gender) %>% 
  write_csv(glue("{data_path}/names.csv"))

starwars %>% 
  select(name, height, mass) %>% 
  write_csv(glue("{data_path}/physical-traits.csv"))

starwars %>% 
  select(name, birth_year) %>% 
  write_csv(glue("{data_path}/birth-year.csv"))

starwars %>% 
  select(name, hair_color, skin_color, eye_color) %>% 
  filter(eye_color %in% c("blue", "yellow", "red")) %>% 
  write_csv(glue("{data_path}/other-traits.csv"))

starwars %>% 
  select(name, homeworld, species) %>% 
  filter(species != "Human") %>% 
  write_csv(glue("{data_path}/place-characteristics.csv"))
