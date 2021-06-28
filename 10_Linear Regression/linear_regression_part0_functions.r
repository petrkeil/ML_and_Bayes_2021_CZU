require(manipulate)

regr.plot <- function(x, y, a, b, sigma)
{
  
  mean.y <- a + b*x
  low.y  <- qnorm(0.025, mean.y, sigma)
  up.y <- qnorm(0.975, mean.y, sigma)
  
  neg.LL <- - sum(dnorm(y, mean=mean.y, sd=sigma, log=TRUE))
  neg.LL <- round(neg.LL, 3)
  
  plot(x, y, main=paste("Neg. LL (a.k.a. deviance) =", neg.LL), pch=19)
  
  lines(x, mean.y, col="red")
  lines(x, low.y, lty=2, col="red")
  lines(x, up.y, lty=2, col="red")
}

