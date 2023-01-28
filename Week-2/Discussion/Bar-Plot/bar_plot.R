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
category_counts <- table(dataset$Category)  
category_counts <- category_counts[order(category_counts, decreasing = TRUE)]

par(mar=c(4, 7, 4, 1))
barplot(category_counts, cex.names=0.7, las = 1, horiz = TRUE, main = "Youtube Top Channels Category Count", col = 'lightpink')