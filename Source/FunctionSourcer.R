#Source packages and functions

#set working directory, import packages, source functions,
setwd(paste(directory,"/Source/", sep = '')) #set temp working directory

#import packages - only need to do this once then can comment out
#install.packages("reshape2", lib="/home/gfl0003", repos='http://cran.us.r-project.org/')
#.libPaths("/home/jrw0107") #need this when defining location of libraries in HPC

#call installed libraries
#library(reshape2)    #need this for plotting
library(scales)      #need this for plotting, this allows transparency in colors for overlapping lines

#source functions
#source(paste(getwd(), "/RunModel.R", sep = ''))
#source(paste(getwd(), "/UpdateBehavior", sep = ''))
#source(paste(getwd(), "/DemographicShift", sep = ''))
#source(paste(getwd(), "/Predictors", sep = ''))
