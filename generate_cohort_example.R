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
library(here)

if (!exists(here("data"))) dir.create(here("data"), showWarnings = FALSE)
if (!exists(here("out"))) dir.create(here("out"), showWarnings = FALSE)

starwars %>% 
select(name, gender) %>% 
  write_csv("data/studypop.csv")

starwars %>% 
  select(name, height, mass) %>% 
  write_csv("data/pnet_data.csv")

starwars %>% 
  select(name, birth_year) %>% 
  readr::write_csv("data/edu_data.csv")

starwars %>% 
  select(name, hair_color, skin_color, eye_color) %>% 
  filter(eye_color %in% c("blue", "yellow", "red")) %>% 
  readr::write_csv("data/msp_service_summary.csv")

starwars %>% 
  select(name, homeworld, species) %>% 
  filter(species != "Human") %>% 
  readr::write_csv("data/dad_service_summary.csv")
