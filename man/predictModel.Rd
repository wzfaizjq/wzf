% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predictModel.R
\name{predictModel}
\alias{predictModel}
\title{Prediction with single model or base ensemble models with multiple machine learning models}
\usage{
predictModel(
  Y,
  X,
  newX,
  base_model,
  cvControl = list(V = 10),
  method = "method.NNLS",
  ...
)
}
\arguments{
\item{Y}{the independence, like certain environmental pollutants(eg. PM2.5) in training data that we
want to predict}

\item{X}{the other predictors(eg. temp, wind speed) in training data that we
want to use to predict air pollutants}

\item{newX}{optional, the new test X data set that we use to predict}

\item{base_model}{character string in format of "SL.xgboost","SL.randomForest"}

\item{cvControl}{list, to control the cross validation for base models, see more details about 'cvControl' in 'SuperLearner' pacakge}

\item{method}{the method of ensemble the base models, "method.NNLS" (the default)}

\item{...}{other parameters that belong to 'SuperLearner' package}
}
\value{
a list including:
dependence: the dependence(X) for training data set
basemodel: the name of base models
model_summary:the summary of base models
ensemble_pre: the ensemble model results(SuperLearner model results)
single_pre:the base models' results
R2: the training model R-squire
RMSE:the training model RMSE
base_ensemble_value: the comparison results for base models
}
\description{
Build base ensemble models and make prediction using new data set
}
\examples{
\dontrun{
# Let's predict the PM2.5 values with machine learning methods

# Splitting training set into two parts based on outcome: 80\% and 20\%
set.seed(1234)
data("envir_example")
size <-
  caret::createDataPartition(y = envir_example$PM2.5, p = 0.8, list = FALSE)
trainset <- envir_example[size, ]
testset <- envir_example[-size, ]

# set the predictor "PM2.5" and dependence variables
y <- c("PM2.5")
x <- colnames(envir_example[-c(1, 6)]) # except "date" and "PM2.5"

# predict the model with several methods(here we choose XGBoost and Random Forest models)

pred_m1 <-
  predictModel(
    Y = trainset[, y],
    X = trainset[, x],
    newX = testset[, x],
    base_model = c("SL.xgboost", ranger),
    cvControl = list(V = 5)
  )

# get the ensemble model(SL) result
head(pred_m1$ensemble_pre)
# get the single base model results
head(pred_m1$single_pre)
}
}
