# Installing necessary packages
if (!require(rstudioapi)) {
  install.packages("rstudioapi")
  library(rstudioapi)
}

# Setting working directory
setwd(dirname(getSourceEditorContext()$path))
setwd('..')

# Obtaining data
if (!exists('dataset'))
{
  data <- read.csv('Data/youtube_subscriptions_data_clean.csv')
  assign('dataset', data, globalenv())
}
# Plotting
stem(dataset$SubscribersFormatted, scale = 1)