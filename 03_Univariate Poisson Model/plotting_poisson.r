
require(manipulate)

move.poisson <- function(lambda)
{
  p.mass <- dpois(0:100, lambda=lambda)
  plot(0:100, p.mass, ylim=c(0,0.2),
       col="red", pch=19, 
       ylab="Probability mass",
       xlab="x")
}

# ------------------------------------------------------------------------------

plot.poisson.ll <- function(x, lambda)
{
  neg.ll <- round(negLL.function(x, lambda),2)
  hist(x, main=paste("Neg. LL =", neg.ll), freq = FALSE, ylim=c(0,0.3), col="grey")
  points(0:20, dpois(0:20, lambda), pch=19, col="red")
}
