#GLM lecture 1 figures





pdf("GLMVariance.pdf",w=8,h=6)
n = 10
poissondata=data.frame(response=rpois(40*n,rep(1:40,n)),  explanatory=rep(1:40,n))
normaldata=data.frame(response=rnorm(40*n,rep(1:40,n),sd=2),  explanatory=rep(1:40,n))
par(mfrow=c(1,2))
plot(normaldata$explanatory,normaldata$response,pch=16,col="#4ECDC450",bty="n",xlab = "Explanatory variable",ylab="Response variable")
plot(poissondata$explanatory,poissondata$response,pch=16,col="#4ECDC450",bty="n",xlab = "Explanatory variable",ylab="Response variable")
dev.off()


pdf("GLMLinearity.pdf",w=8,h=6)
par(mfrow=c(1,2))
n = 10
x = rep(1:40,n)
y = rpois(length(x),exp(0.1*rep(1:40,n)))

poissondata=data.frame(response=y,  explanatory=x)
plot(poissondata$explanatory,poissondata$response,pch=16,col="#4ECDC450",bty="n",xlab = "x",ylab="y")
model = lm(y~x,poissondata)
abline(model,lty=2,col="grey80",lwd=3)
model = glm(y~x,family="poisson",poissondata)
newX = seq(1,40,0.5)
newY = predict(model,newdata=data.frame(x = newX),type="response")
lines(newX,newY,col="#D34311",lwd=3,lty=2)

###
maxV = 100
nV = 1

x = rep(1:maxV,each=nV)
y = c(NA,length(x))

for (i in 1:maxV){
  y[x==i]<-rbinom(nV,1,i/100)
}

plot(x,y,bty="n",type="n", xlab = "x",ylab = "y")
points(x,y,pch=16,col="#4ECDC460",cex=2)
model = lm(y~x)
abline(model,lty=2,col="grey80",lwd=3)

model = glm(y~x,family="binomial")
lines(1:100,predict(model,x=1:100,type="response"),col="#D34311",lwd=3,lty=2)

dev.off()


pdf("GLMErrorNormality1.pdf",w=8,h=6)
n = 10
poissondata=data.frame(response=rpois(40*n,rep(1:40,n)),  explanatory=rep(1:40,n))
normaldata=data.frame(response=rnorm(40*n,rep(1:40,n),sd=2),  explanatory=rep(1:40,n))
par(mfrow=c(1,2))
plot(normaldata$explanatory,normaldata$response,pch=16,col="#4ECDC450",bty="n",xlab = "Explanatory variable",ylab="Response variable")
model = lm(response~explanatory,data=normaldata)
abline(model,col="#D34311",lwd=2,lty=2)
hist(resid(model),col="#4ECDC490",border="#4ECDC4",main="residuals")
dev.off()

pdf("GLMErrorNormality2.pdf",w=8,h=6)
n = 10
poissondata=data.frame(response=rpois(40*n,rep(1:40,n)),  explanatory=rep(1:40,n))
normaldata=data.frame(response=rnorm(40*n,rep(1:40,n),sd=2),  explanatory=rep(1:40,n))
par(mfrow=c(1,2))
plot(poissondata$explanatory,poissondata$response,pch=16,col="#4ECDC450",bty="n",xlab = "Explanatory variable",ylab="Response variable")
model = lm(response~explanatory,data=poissondata)
abline(model,col="#D34311",lwd=2,lty=2)
hist(resid(model),col="#4ECDC490",border="#4ECDC4",main="residuals")
dev.off()

pdf("GLMErrorNormality2.pdf",w=8,h=6)
par(mfrow=c(1,2))
n = 10
x = rep(1:40,n)
y = rpois(length(x),exp(0.1*rep(1:40,n)))

poissondata=data.frame(response=y,  explanatory=x)
plot(poissondata$explanatory,poissondata$response,pch=16,col="#4ECDC450",bty="n",xlab = "x",ylab="y")
model = lm(y~x,poissondata)
abline(model,lty=2,lwd=3,col="#D34311")
hist(resid(model),col="#4ECDC490",border="#4ECDC4",main="residuals")
dev.off()

pdf("GLMErrorNormality2b.pdf",w=8,h=6)
par(mfrow=c(1,2))
n = 10
x = rep(1:40,n)
y = rpois(length(x),exp(0.1*rep(1:40,n)))

poissondata=data.frame(response=y,  explanatory=x)
plot(poissondata$explanatory,poissondata$response,pch=16,col="#4ECDC450",bty="n",xlab = "x",ylab="y")
#model = lm(y~x,poissondata)
#abline(model,lty=2,lwd=3,col="#D34311")
model = glm(y~x,family="poisson",poissondata)
newX = seq(1,40,0.5)
newY = predict(model,newdata=data.frame(x = newX),type="response")
lines(newX,newY,col="#D34311",lwd=2,lty=2)
hist(resid(model),col="#4ECDC490",border="#4ECDC4",main="residuals")
dev.off()







###



pdf("GLM Poisson.pdf",w=8,h=6)

maxV = 100
nV = 1
x = rep(1:maxV,each=nV)
y = c(NA,length(x))

for (i in 1:maxV){
y[x==i]<-rpois(nV,i*.4)
}

plot(x,y)

dev.off()






pdf("LogLink.pdf",w=8,h=6)
par(mfrow = c(1,2))
x  = seq(1,50,5)
y = exp(0.01 + 0.14*x)
plot(x,y,bty="n",type="n", xlab = "x",ylab = "y")
lines(x,y,pch=16,col="#4ECDC4",cex=1,type="b")

plot(x,log(y),bty="n",type="n", xlab = "x",ylab = "log (y)")
lines(x,log(y),pch=16,col="#4ECDC4",cex=1,type="b")
dev.off()


pdf("LogitLink.pdf",w=8,h=6)
par(mfrow = c(1,2))
x = seq(0,200,10)
y = 1/(1+exp(-0.05*(x-100)))
plot(x,y,bty="n",type="n", xlab = "x",ylab = "y")
lines(x,y,pch=16,col="#4ECDC4",cex=1,type="b")

plot(x,log(y/(1-y)),bty="n",type="n", xlab = "x",ylab = "logit y")
lines(x,log(y/(1-y)),pch=16,col="#4ECDC4",cex=1,type="b")

dev.off()




