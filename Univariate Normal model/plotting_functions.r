require(manipulate)

# ------------------------------------------------------------------------------

curve.data <- function(mean, sd)
{
  curve(dnorm(x, mean=mean, sd=sd), from=2, to=6, ylab="p(x)", ylim=c(0, 0.6))
  points(wings, jitter(rep(0, 100), factor=0.3))
}

# ------------------------------------------------------------------------------

curve.data.l.point <- function(mean, sd, i)
{
  L <- dnorm(x=wings[i], mean=mean, sd=sd)
   
  curve(dnorm(x, mean, sd), from=2, to=6, ylim=c(0, 0.6), 
        ylab="p(wings.i | mu, sigma)", xlab="wings",
        main=paste("p(wings.i | mu, sigma) = ", round(L, 4)))

  segments(x0=wings[i], y0=0, x1=wings[i], y1=L, col="red")
  segments(x0=-1, y0=L, x1=wings[i], y1=L, col="red")
  points(wings, rep(0, 100))
  points(wings[i], 0, pch=19)
}

# ------------------------------------------------------------------------------

curve.data.LL <- function(mean, sd)
{
  LL <- neg.LL.function(wings, mean=mean, sd=sd)
   
  curve(dnorm(x, mean, sd), from=2, to=6, ylim=c(0, 1), 
        ylab="p(wings | mu, sigma)", xlab="wings",
        main=paste("Deviance = ", round(LL, 4)))

  points(wings, rep(0, 100))
}




