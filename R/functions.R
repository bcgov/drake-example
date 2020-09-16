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


## From here: https://stackoverflow.com/questions/59400277/using-code-to-plan-and-target-format-fst-in-drake
add_target_format <- function(plan) {
  
  # Get a list of named commands.
  commands <- plan$command
  names(commands) <- plan$target
  
  # Turn it into a good plan.
  do.call(drake_plan, commands)
  
}


#' Join many data frames
#' 
#' This is a very specific function to join data created in this repo
left_join_many <- function(data_to_be_merged) {
  
  if (!inherits(data_to_be_merged, "list")) stop("data_to_be_merged is a not a list")
  
  Reduce(function(...) left_join(...), data_to_be_merged)
}