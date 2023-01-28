# Installing necessary packages
if (!require(rstudioapi)) {
  install.packages("rstudioapi")
  library(rstudioapi)
}

# Setting working directory
setwd(dirname(getSourceEditorContext()$path))
setwd('..')

# Obtaining data
if (!exists('bears'))
{
  data <- read.csv('Data/bears.csv')
  assign('bears', data, globalenv())
}

# Age
stripchart(bears$age, 
           main = 'California Black Bear Age', 
           xlab = 'Age (Months)',
           pch = 8, 
           method = 'jitter', 
           col = 'brown')

# Head Length
stripchart(bears$headlength, 
           main = 'California Black Bear Head Length', 
           xlab = 'Head Length (inches)', 
           pch = 8, 
           method = 'jitter',
           col = 'brown')

# Head Width
stripchart(bears$headwidth,
           main = 'California Black Bear Head Width',
           xlab = 'Head Width (inches)',
           pch = 8,
           method = 'jitter',
           col = 'brown')

# Neck Circumference
stripchart(bears$neckcircum,
           main = 'California Black Bear Neck Circumference',
           xlab = 'Neck Circumference (inches)',
           pch = 8,
           method = 'jitter',
           col = 'brown')

# Length
stripchart(bears$length,
           main = 'California Black Bear Length',
           xlab = 'Length (inches)',
           pch = 8,
           method = 'jitter',
           col = 'brown')

# Chest
stripchart(bears$chest,
           main = 'California Black Bear Chest Width',
           xlab = 'Chest Width (inches)',
           pch = 8,
           method = 'jitter',
           col = 'brown')

# Weight
stripchart(bears$weight,
           main = 'California Black Bear Weight',
           xlab = 'Chest Weight (lbs)',
           pch = 8,
           method = 'jitter',
           col = 'brown')

