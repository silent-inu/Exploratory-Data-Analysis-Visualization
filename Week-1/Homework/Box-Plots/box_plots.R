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
  data <- read.csv('Data/bears.csv')
  assign('bears', data, globalenv())
}

male_bears <- bears[which(bears$gender == 'male'),]
female_bears <- bears[which(bears$gender == 'female'),]

# Age
summary(male_bears$age)
summary(female_bears$age)

par(mfrow=c(1,2))
boxplot(male_bears$age, col = 'lightblue', main = 'Male Black Bears', ylab = 'Age (months)', ylim = c(8.00,177.00))
boxplot(female_bears$age, col = 'lightpink', main = 'Female Black Bears', ylim = c(8.00,177.00) )

# Head Length
summary(male_bears$headlength)
summary(female_bears$headlength)

par(mfrow=c(1,2))
boxplot(male_bears$headlength, col = 'lightblue', main = 'Male Black Bears', ylab = 'Head Length (inches)',  ylim = c(9.00, 17.00))
boxplot(female_bears$headlength, col = 'lightpink', main = 'Female Black Bears', ylim = c(9.00, 17.00))

# Head Width 
par(mfrow=c(1,2))
boxplot(male_bears$headwidth, col = 'lightblue', main = 'Male Black Bears', ylab = 'Head Width (inches)', ylim = c(4.00, 10.00))
boxplot(female_bears$headwidth, col = 'lightpink', main = 'Female Black Bears', ylim = c(4.00,10.00))

# Neck Circumference
summary(male_bears$neckcircum)
summary(female_bears$neckcircum)

par(mfrow=c(1,2))
boxplot(male_bears$neckcircum, col = 'lightblue', main = 'Male Black Bears', ylab = 'Neck Circumference (inches)', ylim = c(10.0, 31.50))
boxplot(female_bears$neckcircum, col = 'lightpink', main = 'Female Black Bears', ylim = c(10.00, 31.50))

# Length
summary(male_bears$length)
summary(female_bears$length)

par(mfrow=c(1,2))
boxplot(male_bears$length, col = 'lightblue', main = 'Male Black Bears', ylab = 'Length (inches)', ylim = c(36.00, 76.50))
boxplot(female_bears$length, col = 'lightpink', main = 'Female Black Bears', ylim = c(36.00, 76.50))

# Chest
summary(male_bears$chest)
summary(female_bears$chest)

par(mfrow=c(1,2))
boxplot(male_bears$chest, col = 'lightblue', main = 'Male Black Bears', ylab = 'Chest Width (inches)', ylim = c(19.00, 55.00))
boxplot(female_bears$chest, col = 'lightpink', main = 'Female Black Bears', ylim = c(19.00, 55.00))

# Weight
summary(male_bears$weight)
summary(female_bears$weight)

par(mfrow=c(1,2))
boxplot(male_bears$weight, col = 'lightblue', main = 'Male Black Bears', ylab = 'Weight (lbs)', ylim = c(26.0, 514.0))
boxplot(female_bears$weight, col = 'lightpink', main = 'Female Black Bears', ylim = c(26.0, 514.0))
