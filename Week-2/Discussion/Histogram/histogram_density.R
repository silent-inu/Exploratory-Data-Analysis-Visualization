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
dens <- density(dataset$SubscribersFormatted)
hist(dataset$SubscribersFormatted, freq = FALSE, main = 'Top Youtube Channels Subscriber Counts', xlab = 'Number of Subscribers (millions)', col = 'lightblue')
lines(dens, lwd = 2, lty = 1)