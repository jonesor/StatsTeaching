islands <- read.csv("britainSpecies.csv",header=TRUE)
pairs(islands)

islands = subset(islands,Name!="Britain")

plot(islands$Area,islands$nSpecies)

model = glm(nSpecies~Area,data=islands,poisson)
summary(model)
#The model is really overdispersed

plot(islands$Area,islands$nSpecies)
newData <- data.frame(Area = seq(0, 2000, 1))
newData$fit = predict(model,newdata = newData,type="response")
lines(newData$Area, newData$fit, col = "red")
#This doesn;t look great.
#Should try logging the Area for an improved fit


plot(log(islands$Area),islands$nSpecies)
model2 = glm(nSpecies~log(Area),data=islands,quasipoisson)
summary(model2)
newData <- data.frame(Area = seq(0, 2000, 1))
newData$fit = predict(model,newdata = newData,type="response")
lines(log(newData$Area), newData$fit, col = "red")


#Cannot directly compare quasi to poisson, but look at Residual deviance - it is an improvement.


plot(log(islands$DistanceFromMainland),islands$nSpecies)



#
maze <- read.csv("maze.csv",header=TRUE)
names(maze)
plot(maze$Age,maze$averageErrors)
t.test(averageErrors~Age,data=maze)

model = lm(averageErrors~Age,data=maze)

model = glm(averageErrors~Age,data=maze,Gamma)
model
summary(model)
newdata = data.frame(Age=c("Adult","Child"))
predict(model,newdata=newdata,type="response")
tapply(maze$averageErrors,maze$Age,mean)

###
goals <- read.csv("NFLfieldgoal.csv",header=TRUE)
plot(goals$Distance,goals$Success)
#plot(jitter(goals$Distance),jitter(goals$Success))

model <- glm(Success~Distance,data=goals,binomial)
summary(model)
newData <- data.frame(Distance = seq(0, 60, .5))
newData$fit = predict(model,newdata = newData,type="response")
lines(newData$Distance, newData$fit, col = "red")




morph <- read.csv("morphometry.csv",header=TRUE)
pairs(morph)

par(mfrow=c(1,2))
plot(morph$FootLength,morph$Height,col=morph$Sex)

plot(morph$HandLength,morph$Height,col=morph$Sex)

model1 <-lm(Height~FootLength*Sex,data=morph)
model2 <-lm(Height~FootLength+Sex,data=morph)
anova(model1,model2, test="Chi")

species <- read.csv("Species.csv",header=TRUE)
names(species)

plot(species$Biomass,species$Species)
model = glm(Species~Biomass*pH,data=species,poisson)
summary(model)