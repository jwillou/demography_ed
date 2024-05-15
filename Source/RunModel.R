setwd("/Users/jannawilloughby/Google Drive/My Drive/Willoughby lab/projects - active/dolphins and turtles/demography_ed/")
#setwd("/Users/jrw0107/Google Drive/My Drive/Willoughby lab/projects - active/dolphins and turtles/demography_ed/")

#load necessary data
survey_data = read.table("Input/Cleaned up Coastal Tourist Combined Data - modified codes.csv", header=T, sep=",")

#create agents from survey data and set initial knowledge level                                       
agents = survey_data
agents$knowledge_level = apply(agents[,17:18],1,mean, na.rm=T) #mean of policy and wildlife knowledge  ####should this be changed?

#setup output object
OUT = NULL

#run simulations for each scenario, 100 replicates per scenario
for (i in 1:nrow(scenarios)) {
  outreach_efforts  = scenarios$outreach_efforts[i]
  outreach_method   = scenarios$outreach_method[i]
  demographic_shift = scenarios$demographic_shift[i]
  
  for(rr in 1:1){ #run 100 replicates eventually
    #start with a fresh set of individuals
    rragents = agents
    
    for(y in 1:20){
      #calculate negative interactions this year based on demographics/knowledge                         ####need Hannah to weigh in on this equation
      
      
      #save behaviors etc for analysis later
      tosave = c(i,rr,y, outreach_efforts, outreach_method, demographic_shift, summariesdemos, summariesoutreach, summariesbehaviors) #summaries need to be updated
                 #should we have yearly education, education targets based on media type, and run for 10 years? 
                 #assumptions would be that outreach prefs don't change
      
      #change demographic composition based on scenario
      rragents = DemographicShift(rragents, demographic_shift)
      
      #apply teaching outreach based on scenario and designated frequency
      if((y %% outreach_efforts) == 0){ #note: %% is the modulus operator for R, runs if remainder is zero in this case
        rragents = UpdateBehavior(rragents, outreach_method, community)
      }
      
      #apply "forgetfulness" penalty to policy/wildlife knowledge                                        ####need Hannah to advise
      
      
    }
  }
}
  


