# Introduction to R code from October 25 workshop with Berenica Vejvoda, Data Librarian
# October 25, 2024 
# R is an open-source programming language and software environment for statistical computing and graphics that is supported by the R Foundation for Statistical Computing. 
# R packages give R its functionality
# 10,000+ packages available for installation (packages are similar to extensions or apps for other products like Google or Apple).  
# Each package serves a purpose and has specific commands you can use. 
# Packages are user-created programs which can be used to run a specific task or set of tasks.
# RStudio is an IDE (integrated development environment) for R 
# Need to install R first then RStudio
# RStudio makes it easier to: 
    # View datasets as spreadsheets  
    # See the results of your script (e.g. plot)
    # Change your plot in the plot display without re-running your code (e.g. size)
    # Install packages (collections of R functions, data and compiled code) 
    # Set your working directory and access your files
    # Can help you work more efficiently by providing further functionality
# Creating an R Script for your work
# Very important so you can keep your code for future 
# Click File -> New File -> R Script
# Basics of R
# R as scientific calculator
# Click alt-enter to run each line of code or highlight code and click Run button on top right
2+3
pi
2+3*pi
log(2+3*pi)
exp(2.435785)
6/7
# Entering and manipulating data in R
# An assignment operator is used to assign the value on the right to the variable on the left can use <- or = (also: ALT + for shortcut keys; Option + for Mac)
# Scaler variables
# Simple single numeric value such as 1, 2/3, 3.14
a <- 10
a
b <- 5
b
b/a
# Vector variables
# A vector is used when you want to store and modify a set of values. The data types can be logical, integer, double, and character. You can also use the operator ; to create a vector:
a <- 1:8;
a
# To combine values into a vector use the “c ()” (concatenate function).
# You can also apply functions to vectors.
x <- c(2,5,8,9,7,4,6,8)
x
y <- c(9,6,4,7,4,6,8,9,4,3,2)
y
x[7]
y[7]
x[1:4]
y[y>4]
length(y)
length(x)
mean(x)
mean(y)
var(x)
sqrt(var(x))
# Summary statistics
# You can also apply simple statistical calculations to vectors.
# Summary () mean, median, 25th and 75th quartiles, min, max 
summary(x)
# Character variables
walks_everyday <-c("yes", "no", "yes", "no", "no", "yes")
walks_everyday
# Install R packages. Can also do this from bottom left console window (see tab "Packages")
# We will install readr and vegan packages
install.packages("readr")
install.packages("vegan")
# Load installed R packages
# We need to load the installed package into R from the /library location.
library(readr)
library(vegan)
# Using the help function with "?"
?vegan
help(vegan)
# Set working directory
setwd('C:/RCarpentrySession1')
# Double check you have set it up right
getwd()
# Loading data into R
# R programming allow you to import a dataset, which can be a comma-separated values (CSV) file, Excel file, tab-separated file, JSON file, or others like SPSS, Stata or SAS. 
# Reading data into the R console or R Studio is important, since you must have some data before you can do statistical computing and understand the data.
# You can read a comma-separated values (CSV) file using the read.csv() function in the R programming language. 
# Download varespec to your laptop from this URL and store it somewhere you can navigate to on your laptop: https://gist.github.com/essicolo/cd5c8b77c91e14b9fe648d63f9afaed9
# Unzip the dataset
# Now read in the dataset to R
# header = true recognizes that the first row is a header (variable names)
varespec <- read.csv(file="C:/RCarpentrySession1/varespec.csv", header=TRUE)
# Viewing the data - remember it's a capital "V"
View(varespec)
# Display class of data type
class(varespec)
# List variables
ls(varespec)
# Alternatively
names(varespec)
# Disply a variable's responses
varespec$Callvulg
# Display # of columns and row
ncol(varespec)
nrow(varespec)
# Using the select function 
selected_columns <- varespec[, c('ID', 'Callvulg', 'Vaccmyrt')]
# Now display the selected columns. By default R displays the first 6 rows. To see more rows you can specify - e.g., 24
head(selected_columns, 24)
# Renaming variables
# Rename the 'Callvulg' column to 'Callvulg2' using base R 
names(varespec)[names(varespec) == 'Callvulg'] <- 'Callvulg2'
# Verify the change by checking the column names 
names(varespec)
# names(varespec): This retrieves the column names of the varespec dataframe.
# names(varespec) == 'Callvulg': This creates a logical vector that is TRUE where the column name matches 'Callvulg'.
# names(varespec)[...] <- 'Callvulg2': This assigns the new column name 'Callvulg2' to the position where the logical vector is TRUE.
# After running this code, the Callvulg column will be renamed to Callvulg2
# Creating a back up of your dataset
# Very important to not lose your work or override if you don't intend to. There is no un-do function!
varespec_backup <- varespec
# To revert back to the original dataframe 
varespec <- varespec_backup
# Declaring missing values
# Converting 0.00 to NA can be justified for several reasons:
# 1.	Data Quality: 0.00 may represent a lack of data rather than a meaningful value, such as when a measurement was not taken or is unknown. Replacing it with NA helps to clarify that this entry should not be interpreted as valid data.
# 2.	Statistical Analysis: Many statistical methods treat NA values differently from zeros. By converting 0.00 to NA, you can avoid misleading results in analyses that should exclude non-representative values, such as when calculating means, variances, or conducting regression analyses.
# 3.	Data Integrity: It helps maintain the integrity of the dataset by distinguishing between actual zero values (which may be significant) and entries that are missing or undefined.
# 4.	Visualization Clarity: When visualizing data, representing missing values as NA can lead to clearer and more informative plots, helping to better convey the data’s story without obscuring it with misleading zeros.
varespec[varespec == 0] <- NA
View(varespec)


