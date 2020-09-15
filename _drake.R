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

source("code/setup.R")
source("code/generate_data.R")
source("R/functions.R")


# Data --------------------------------------------------------------------

data_plan = code_to_plan("code/01-data/data.R") %>% 
  add_target_format()
join_plan = code_to_plan("code/01-data/merging.R") %>%
  add_target_format()


# Cleaning ----------------------------------------------------------------

cleaning_plan = code_to_plan("code/02-cleaning/remove_na.R")


# Model -------------------------------------------------------------------

model_plan = code_to_plan("code/03-model/model.R")

report_plan = drake_plan(report = rmarkdown::render(
  knitr_in("report.Rmd"),
  output_file = file_out("out/report.html"),
  quiet = TRUE
))


# Combine Plans
preplan = bind_plans(
  data_plan,
  join_plan,
  cleaning_plan,
  model_plan,
  report_plan
  )



config <- drake_config(preplan)
