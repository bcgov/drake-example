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


data_split <- merged_clean_data %>%
  initial_split(prop = 0.8)

data_training <- training(data_split)
data_testing <- testing(data_split)


fit_lm <- train(height ~ mass, 
                method = "lm", 
                data = data_training,
                trControl = trainControl(method = "none"))


results <- data_training %>%
  mutate(lm.param = predict(fit_lm, data_training))


model_performance <- metrics(results, truth = height, estimate = lm.param)


test_results <- data_testing %>%
  mutate(lm.param = predict(fit_lm, data_testing))
