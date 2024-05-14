# Function to apply demographic shift
DemographicShift <- function(agents, demographic_shift) {
  # Example rule: Increase the number of agents in a specific demographic segment
  if (demographic_shift == 1) {
    new_agents <- agents[sample(1:nrow(agents), size = nrow(agents) * shift, replace = TRUE), ]
    agents <- rbind(agents, new_agents)
  }
  return(agents)
}