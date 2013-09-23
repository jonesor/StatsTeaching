lln.demo <- function(data, distn = "Mystery", EX = 0, sigma=1, true.mean
         = T,hilim=5.5,lolim=-0.5,fixed.int=T,random.int=T,wide=3)
{
##      FUNCTION "lln.demo" by Richard Royall & Jeffrey Blume 
##      Latest revision on 11/2000
##	Converted to R by Aaron Ellison
##	November 2012 
##
##      Variables and their function
##      data:   vector of observations
##      distn:  name of population distribution in title
##      EX:     expected value of an individual from distn
##      sigma:  standard deviation of an individual from distn
##      true.mean:      plots a straight line at EX
##      lolim and hilim:        limits of y-axis
##      fixed.int:      plots the fixed interval
##      random.int:     plots the random interval 
##      wide:   confidence cofficient on Z-scale for intervals

        z <- c(1:length(data))
        x <- z
        for(i in 1:length(data)) {
                x[i] <- mean(data[1:i])
        }
        plot(z, x, type = "n", xlab = "sample size", ylim=c(lolim,hilim),
                ylab = " ", main = paste(
                "Sample Means for a Sequence of IID Random Variables\n",
                distn, " Probability Distribution"))
        lines(z,x,lty=1,col=1)
        if(true.mean == T) {
                y <- rep(1, length(z)) * EX
                lines(z, y, lty = 2, col=1)
        }
        if(fixed.int == T) {
                lim1 <- EX+wide*sigma/sqrt(z)
                lim2 <- EX-wide*sigma/sqrt(z)
                lines(z, lim1, lty = 2,col=1)
                lines(z, lim2, lty = 2,col=1)
        }
        if(random.int == T) {
                lim1 <- x+wide*sigma/sqrt(z)
                lim2 <- x-wide*sigma/sqrt(z)
                lines(z, lim1, lty = 1,col=1)
                lines(z, lim2, lty = 1,col=1)
        }


if(random.int==F & fixed.int == F) {
legend(c(length(z)/2,length(z)),c(1*(hilim-lolim)/3,(hilim-lolim)/12),
bty="n",col=c(1,1),lty=c(2,1),
c(paste("Popultation mean"),
paste("Sample mean \n ( last is ",signif(mean(data), 3)," )")),cex=1)
}

if(random.int==F & fixed.int == T) {
legend(c(length(z)/2,length(z)),c(1*(hilim-lolim)/3,(hilim-lolim)/12),
bty="n",col=c(1,1,0,1,0),lty=c(2,1,0,2,0),
c(paste("Popultation mean"),
paste("Sample mean"), 
paste("  ( last is ",signif(mean(data), 3)," )"),
paste("Probability interval"),
paste("  ( last is ",
signif(EX-wide*sigma/sqrt(max(z)), 3)," to ",
signif(EX+wide*sigma/sqrt(max(z)), 3)," )")),cex=1) }

if(random.int==T & fixed.int == F) {
legend(c(length(z)/2,length(z)),c(1*(hilim-lolim)/3,(hilim-lolim)/12),
bty="n",col=c(1,1,0,1,0),lty=c(2,1,0,1,0),
c(paste("Popultation mean"),
paste("Sample mean"), 
paste("  ( last is ",signif(mean(data), 3)," )"),
paste("Confidence interval"),
paste("  ( last is ",
signif(mean(data)-wide*sigma/sqrt(max(z)), 3)," to ",
signif(mean(data)+wide*sigma/sqrt(max(z)), 3)," )")),cex=1) }

if(random.int==T & fixed.int == T) {
legend(c(length(z)/2,length(z)),c(1*(hilim-lolim)/3,(hilim-lolim)/12),
bty="n",col=c(1,1,0,1,0,1,0),lty=c(2,1,0,2,0,1,0),
c(paste("Population mean"),
paste("Sample mean"), 
paste("  ( last is ",signif(mean(data), 3)," )"),
paste("Probability interval"),
paste("  ( last is ",
signif(EX-wide*sigma/sqrt(max(z)), 3)," to ",
signif(EX+wide*sigma/sqrt(max(z)), 3)," )"),
paste("Confidence interval"),
paste("  ( last is ",
signif(mean(data)-wide*sigma/sqrt(max(z)), 3)," to ",
signif(mean(data)+wide*sigma/sqrt(max(z)), 3)," )")),cex=1) }

}

############################################################################

find.seq <- function(n=100,after=20,EX=.25,sigma=0.04,far=3.5){
x_rep(EX-2,n)
z_seq(1,n,1)
while (max(x[after:n]-far*sigma/sqrt(z[after:n]))<EX) {
data_rnorm(n,EX,sigma)
z <- c(1:length(data))
x <- z
for(i in 1:length(data)) {
x[i] <- mean(data[1:i])}
}
data}

###
##
#