#calculate mean knowldge
survey_data$MeanKnowledge = rowMeans(survey_data[, c("Policy", "Wildlife")], na.rm = TRUE)
survey_data$MeanView = rowMeans(survey_data[, c("Turtleview", "Dolphinview", "Wildlifeview")], na.rm = TRUE) #"Turtleview", "Dolphinview", "Wildlifeview",

#list of variables to run regressions on, excluding 'Race', 'Hispanic', and 'Gender'
variables = c("Age", "ALResident", "Education", "Visitor", "Beach", "MeanView", "Fishbeach", "Fishjetty", "Fishboat", "Boatmotor", "Boatsail", "Angler")

#prepare a data frame to store results
results = data.frame(variable = character(), coefficient = numeric(), pvalue = numeric(), rsquared = numeric())

#loop through variables and perform regression
for (var in variables) {
  formula = as.formula(paste("MeanKnowledge ~", var))
  model = lm(formula, data = survey_data)
  summary_model = summary(model)
  coef_model = coef(summary_model)[2, ]  
  results = rbind(results, data.frame(variable = var, coefficient = coef_model["Estimate"], pvalue = coef_model["Pr(>|t|)"], rsquared = summary_model$r.squared))
}

#buid a single model
filterresults = results[results$pvalue<0.05 & results$rsquared>0.02,]
filterlm = lm(MeanKnowledge~Age+Education+Beach+MeanView, data=survey_data)
summary(filterlm)

#make sure it isn't garbage before we take coeffs into ABM
#residuals plot
plot(filterlm$residuals ~ filterlm$fitted.values, xlab = "Fitted values", ylab = "Residuals",main = "Residuals vs Fitted")
abline(h = 0, col = "red")

#Q-Q plot for normality
qqnorm(filterlm$residuals, main = "Q-Q Plot of Residuals")
qqline(filterlm$residuals, col = "red")

#leverage plot
library(car)
influencePlot(filterlm, id.method = "identify", main = "Influence Plot", sub = "Circle size is proportional to Cook's distance")

#variance Inflation Factor to check for multicollinearity
vif(filterlm)

