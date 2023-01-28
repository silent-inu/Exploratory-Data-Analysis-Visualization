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

# Length - Gender
bears_ordered_length <- bears[order(bears$length),]

dotchart(bears_ordered_length$length, 
         labels = bears_ordered_length$gender, 
         main = 'California Black Bear Length to Gender',
         xlab = 'Length (inches)', 
         ylab = 'Gender', 
         pch = 8, 
         cex = 0.5)

# Chest Width - Gender
bears_ordered_chest <- bears[order(bears$chest),]

dotchart(bears_ordered_chest$chest, 
         labels = bears_ordered_chest$gender, 
         main = 'California Black Bear Chest Width to Gender',
         xlab = 'Chest Width (inches)', 
         ylab = 'Gender', 
         pch = 8, 
         cex = 0.5)

# Weight - Gender
bears_ordered_weight <- bears[order(bears$weight),]

dotchart(bears_ordered_weight$weight, 
         labels = bears_ordered_weight$gender, 
         main = 'California Black Bear Weight to Gender',
         xlab = 'Weight (lbs)', 
         ylab = 'Gender', 
         pch = 8, 
         cex = 0.5)