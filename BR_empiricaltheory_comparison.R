library(deSolve)
source("BR_theory_mainfunction.R")
source("BR_theory_mainparameters.R")
t0 <- 0
dt <- .1
tf <- 100
trecord <- 3/dt+1
tv <- seq(t0,tf,dt)
tsteps <- length(tv)

parms_LN_Nfixer <- list(vF,v0,EF,phi,m=mF,k,betaF,gammaF,beta0,gamma0,Fmax,z,Fmin,
                        wF,w0,uF,u0,I=0.01282051)
parms_LN_nonfixer <- list(vF,v0,EF,phi,m=m0,k,betaF,gammaF,beta0,gamma0,Fmax,z,Fmin,
                          wF,w0,uF,u0,I=0.01282051)
parms_MN_Nfixer <- list(vF,v0,EF,phi,m=mF,k,betaF,gammaF,beta0,gamma0,Fmax,z,Fmin,
                        wF,w0,uF,u0,I=0.2692308)
parms_MN_nonfixer <- list(vF,v0,EF,phi,m=m0,k,betaF,gammaF,beta0,gamma0,Fmax,z,Fmin,
                          wF,w0,uF,u0,I=0.2692308)

# Initial conditions:
B0init <-  0.03982222
BFinit <-  0.1438235
Linit <- 4.896976
Ainit <- 0.007602611

# Run model:
op_Nfixer_LN <- lsoda(c(BFinit,Linit,Ainit),tv, N_model_ode_Nfixer, parms_LN_Nfixer)
op_nonfixer_LN <- lsoda(c(B0init,Linit,Ainit),tv, N_model_ode_nonfixer, parms_LN_nonfixer)
op_Nfixer_MN <- lsoda(c(BFinit,Linit,Ainit),tv, N_model_ode_Nfixer, parms_MN_Nfixer)
op_nonfixer_MN <- lsoda(c(B0init,Linit,Ainit),tv, N_model_ode_nonfixer, parms_MN_nonfixer)
