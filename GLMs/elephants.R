ele <- read.csv("elephPoach.csv")
summary(ele)

plot(ele$MoneyPKM,ele$ElephantsKilled,ylim=c(0,40))

model <- glm(ElephantsKilled~MoneyPKM,data=ele,family=poisson)
summary(model)
model <- glm(ElephantsKilled~MoneyPKM,data=ele,family=quasipoisson)
summary(model)
pv = predict.glm(model,newdata = data.frame(MoneyPKM = seq(0,50,0.5)),type="response")
points(seq(0,50,0.5),pv)



plot(ele$Salary,ele$ElephantsKilled,ylim=c(0,40))

model <- glm(ElephantsKilled~Salary,data=ele,family=poisson)
summary(model)
model <- glm(ElephantsKilled~Salary,data=ele,family=quasipoisson)
summary(model)
pv = predict.glm(model,newdata = data.frame(Salary = seq(0,130,0.5)),type="response")
points(seq(0,130,0.5),pv)

plot(ele$Transport,ele$ElephantsKilled,ylim=c(0,40))
plot(ele$Bonus,ele$ElephantsKilled,ylim=c(0,40))

plot(ele$KMperScout,ele$ElephantsKilled,ylim=c(0,40))
model <- glm(ElephantsKilled~KMperScout,data=ele,family=poisson)
summary(model)
model <- glm(ElephantsKilled~KMperScout,data=ele,family=quasipoisson)
summary(model)

plot(ele$PatrolDaysperKM,ele$ElephantsKilled,ylim=c(0,40))

plot(ele$KMperCarrier,ele$ElephantsKilled,ylim=c(0,40))
