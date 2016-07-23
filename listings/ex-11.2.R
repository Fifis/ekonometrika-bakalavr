

prob <- glm(default ~ 1 + age + acadmos + adepcnt + majordrg + minordrg + ownrent + income + selfempl + incper + exp_inc + spending, family = binomial(link = "probit"), data = data_default)
summary(prob)

loglik <- 0.5*(-prob$aic+2*length(prob$coefficients))
prob0 <- glm(default ~ 1, family = binomial(link = "probit"), data = data_default)
loglik0 <- 0.5*(-prob0$aic+2*length(prob0$coefficients))
MFrsq <- 1-(loglik/loglik0)
MFrsq

prob <- glm(default ~ 1+age + adepcnt+majordrg+minordrg+ownrent+income+spending, family = binomial(link = "probit"), data = data)
summary(prob)

install.packages("mfx")
library(mfx)
probitmfx(prob, data=data_default)
