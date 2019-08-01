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

plan <- drake_plan(
  studypop = readr::read_csv(file_in("data/studypop.csv")),
  dad_service_summary = readr::read_csv(file_in("data/dad_service_summary.csv")),
  edu_data = readr::read_csv(file_in("data/edu_data.csv")),
  msp_service_summary = readr::read_csv(file_in("data/msp_service_summary.csv")),
  pnet_data = readr::read_csv(file_in("data/pnet_data.csv")),
  merge1 = studypop %>%
    left_join(dad_service_summary),
  merge2 = merge1 %>% 
    left_join(edu_data),
  merge3 = merge2 %>% 
    left_join(msp_service_summary),
  merge4 = merge3 %>% 
    left_join(pnet_data),
  export = readr::write_csv(merge4, file_out("out/final_merge.csv"))
)