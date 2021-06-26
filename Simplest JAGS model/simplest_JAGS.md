First model in JAGS
========================================================
Petr Keil

June 2021

![](Thomas_Bayes.png)



JAGS - preparing the data
========================================================
![](thereva.png)

*Pandivirilia eximia* (Meigen 1820), family *Therevidae*

JAGS - preparing the data
========================================================
![](trunk.png)

Our data are **counts of larvae** sampled from underneath 
logs in a temperate primeval forest.

JAGS - preparing the data
========================================================

```r
y <- c(23,17,25,28,38,18,32,51,
       32,41,51,33,21,52,11,19)
N <- length(y)

my.data <- list(y=y, N=N)
my.data
```

```
$y
 [1] 23 17 25 28 38 18 32 51 32 41 51 33 21 52 11 19

$N
[1] 16
```

Bayes rule and the JAGS syntax
========================================================
 
$$p(\theta|y) = \frac {p(\theta) \times p(y|\theta)}{p(y)}$$

where $\theta$ are model parameters, and $y$ are the data

$p(y|\theta)$ ... likelihood

$p(\theta)$ ... prior

$p(\theta|y)$ ... posterior

$p(y)$ ... the horrible thing


JAGS - model specification
========================================================
This is the model that we will fit:
$y_i \sim Poisson(\lambda)$

```
model
{
  # p(lambda) 
  
  # p(y|lambda)
  
}
```

JAGS - model specification
========================================================
This is the model that we will fit:
$y_i \sim Poisson(\lambda)$

```
model
{
  # p(lambda) ... prior
  
  # p(y|lambda) ... likelihood
  
}
```

JAGS - model specification
========================================================
This is the model that we will fit:
$y_i \sim Poisson(\lambda)$

```
model
{
  # prior
    lambda ~ dunif(0, 100)

  # likelihood
    for(i in 1:N)
    {
      y[i] ~ dpois(lambda)    
    }
}
```

JAGS - model specification
========================================================
We will dump the model to a file using ```cat("", file="")```


```r
cat("
model
{
  # prior
    lambda ~ dunif(0, 100)

  # likelihood
    for(i in 1:N)
    {
      y[i] ~ dpois(lambda)    
    }
}
", file="my_model.txt")
```

JAGS - model specification
========================================================

```r
library(R2jags)

fitted.model <- jags(data=my.data,  model.file="my_model.txt", parameters.to.save="lambda", n.chains=3, n.iter=2000, n.burnin=1000)
```

```
Compiling model graph
   Resolving undeclared variables
   Allocating nodes
Graph information:
   Observed stochastic nodes: 16
   Unobserved stochastic nodes: 1
   Total graph size: 20

Initializing model
```

JAGS - model specification
========================================================

```r
  plot(as.mcmc(fitted.model))
```

![plot of chunk unnamed-chunk-4](simplest_JAGS-figure/unnamed-chunk-4-1.png)

JAGS - model specification
========================================================

```r
  fitted.model
```

```
Inference for Bugs model at "my_model.txt", fit using jags,
 3 chains, each with 2000 iterations (first 1000 discarded)
 n.sims = 3000 iterations saved
         mu.vect sd.vect    2.5%     25%     50%     75%   97.5%  Rhat n.eff
lambda    30.795   1.385  28.165  29.889  30.786  31.666  33.554 1.004   580
deviance 165.871   1.454 164.876 164.969 165.293 166.179 169.962 1.002  3000

For each parameter, n.eff is a crude measure of effective sample size,
and Rhat is the potential scale reduction factor (at convergence, Rhat=1).

DIC info (using the rule, pD = var(deviance)/2)
pD = 1.1 and DIC = 166.9
DIC is an estimate of expected predictive error (lower deviance is better).
```

JAGS - model specification
========================================================

```r
  plot(fitted.model)
```

![plot of chunk unnamed-chunk-6](simplest_JAGS-figure/unnamed-chunk-6-1.png)

