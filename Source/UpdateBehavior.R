# Function to update agent behavior based on outreach and demographic shift
UpdateBehavior <- function(agent, outreach_intensity, community) {
  # Example rule: Increase knowledge based on outreach intensity
  agent$knowledge_level <- agent$knowledge_level + outreach_intensity
  
  ####What else should change an individual's probability of behavior?
  
  return(agent)
}