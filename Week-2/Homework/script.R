# Installing necessary packages
if (!require(rstudioapi) | !require(lattice) | !require(multcomp)) {
  install.packages("rstudioapi")
  install.packages("lattice")
  install.packages("multcomp")
  
  library(rstudioapi)
  library(lattice)
  library(multcomp)
}

# Setting working directory
setwd(dirname(getSourceEditorContext()$path))
setwd('..')

# Obtaining data
if (!exists('dataset'))
{
  dataset <- read.csv('Data/bodyfat.csv')
}

# Categorizing bodies based on body fat
bodycat <- c()
bodycat[dataset$bodyfat < 14.00] <- 'Athlete'
bodycat[dataset$bodyfat >= 14.00 & dataset$bodyfat <= 25.00] <- 'Average'
bodycat[dataset$bodyfat > 24] <- 'Obese'
dataset <- cbind(dataset, bodycat)
dataset$bodycat <- factor(dataset$bodycat, levels = c('Athlete', 'Average', 'Obese'))
rm(bodycat)

# Categorizing bodies based on height
summary(dataset$height)
htcat <- c()
htcat[dataset$height < 68.25] <- 'short'
htcat[dataset$height >= 68.25 & dataset$height < 70.00] <- 'below average'
htcat[dataset$height >= 70.00 & dataset$height < 72.25] <- 'above average'
htcat[dataset$height >= 72.25] <- 'tall'
dataset <- cbind(dataset, htcat)
dataset$htcat <- factor(dataset$htcat, levels = c('short', 'below average', 'above average', 'tall'))
rm(htcat)

# Violin plot
bwplot(dataset$weight~dataset$bodycat, xlab = 'Body Category', ylab = 'Body Weight', panel = panel.violin)

# Stem and lead plot
stem(dataset$weight, scale = 1.0)

# Overlapping histograms + density plots for neck separated by body type
hist(dataset$neck[dataset$bodycat == 'Average'], breaks = 10, freq = FALSE, main = 'Neck Circumference (cm)' , xlab = 'Neck Circumference (cm)', col = rgb(1.00, 0.00, 0.00, 0.25), xlim = c(31.10, 51.20), ylim = c(0.00, 0.23))
hist(dataset$neck[dataset$bodycat == 'Obese'], freq = FALSE, col = rgb(0.00, 1.00, 0.00, 0.25), add = TRUE)
hist(dataset$neck[dataset$bodycat == 'Athlete'], freq = FALSE, col = rgb(0.00, 0.00, 1.00, 0.25), add = TRUE)
lines(density(dataset$neck[dataset$bodycat == 'Average']), lwd = 1.0)
lines(density(dataset$neck[dataset$bodycat == 'Obese']), lwd = 2.0)
lines(density(dataset$neck[dataset$bodycat == 'Athlete']), lwd = 3.0)
legend('topright', c('Average', 'Obese', 'Athlete'), col = c(rgb(1.00, 0.00, 0.00, 0.25), rgb(0.00, 1.00, 0.00, 0.25), rgb(0.00, 0.00, 1.00, 0.25)), lwd = 10)

# Overlapping histograms + density plots for abdomen separated by height
hist(dataset$abdomen[dataset$bodycat == 'Average'], freq = FALSE, main = 'Abdomen Circumference (cm)' , xlab = 'Abdomen Circumference (cm)', col = rgb(1.00, 0.00, 0.00, 0.25), xlim = c(69.40, 148.1), ylim = c(0.00, 0.07))
hist(dataset$abdomen[dataset$bodycat == 'Obese'], freq = FALSE, col = rgb(0.00, 1.00, 0.00, 0.25), add = TRUE)
hist(dataset$abdomen[dataset$bodycat == 'Athlete'], freq = FALSE, col = rgb(0.00, 0.00, 1.00, 0.25), add = TRUE)
lines(density(dataset$abdomen[dataset$bodycat == 'Average']), lwd = 1)
lines(density(dataset$abdomen[dataset$bodycat == 'Obese']), lwd = 2.0)
lines(density(dataset$abdomen[dataset$bodycat == 'Athlete']), lwd = 3.0)
legend('topright', c('Average', 'Obese', 'Athlete'), col = c(rgb(1.00, 0.00, 0.00, 0.25), rgb(0.00, 1.00, 0.00, 0.25), rgb(0.00, 0.00, 1.00, 0.25)), lwd = 10)


