install.packages(c("mlflow", "carrier", "rpart"))
library(mlflow)
library(rpart)
with(mlflow_start_run(), {
  cp <- mlflow_param("cp", default = 0.05)
  maxdepth <- mlflow_param("maxdepth", default = 3)
  mlflow_log_param('cp', cp)
  mlflow_log_param('maxdepth', maxdepth)
  tree <- rpart(
    Species ~ ., 
    data = iris, 
    method = "class", 
    control = rpart.control(cp = cp, maxdepth = maxdepth)
  )
  predictor <- carrier::crate(
    function(x) {rpart:::predict.rpart(model, x, type = "class")},
    model = tree
  ) 
  mlflow_log_model(predictor, "model")
})