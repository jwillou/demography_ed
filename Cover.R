#Cover.R used to manage parameters and values and set scenarios for simulations
#Janna Willoughby, Hannah Henry, TiAnna Olivas 2024

#Set working directory and out directory
setwd("/Users/jannawilloughby/Google Drive/My Drive/Willoughby lab/projects - active/dolphins and turtles/demography_ed/")
directory = getwd()
outdir = paste(directory, "Output/", sep = "")

#Source function scripts
source(paste(directory, "/Source/FunctionSourcer.R", sep = ''))

#Set scenarios
outreach_efforts.P  = c(1, 2, 3)                                         #Number of new outreach items produced annually
outreach_method.P   = c("Pamphlet", "Sign", "Magnet", "Sticker")         #Outreach media that will be used
demographic_shift.P = c("Age10", "IncreaseHispanic")                     #These will need to be defined, not sure what we want
scenarios = expand.grid(outreach_efforts.P, outreach_method.P, demographic_shift.P)
remove(outreach_efforts.P, outreach_method.P, demographic_shift.P)                        
colnames(scenarios) = c("outreach_efforts", "outreach_method", "demographic_shift")

#Run model iterating over parameters 
for(r in 1:nrow(parameters)){
  RunModel(parameters, r, directory, scenarios)
}


