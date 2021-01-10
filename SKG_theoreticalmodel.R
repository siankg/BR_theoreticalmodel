# This code accompanies the following manuscript:
# Nitrogen-fixing trees mitigate or exacerbate climate change relative to non-fixing trees depending on nitrogen input
# Sian Kou-Giesbrecht*1, Jennifer L. Funk2, Steven S. Perakis3, Amelia A. Wolf4, and Duncan N. L. Menge1
# 1Department of Ecology, Evolution, and Environmental Biology, Columbia University, New York, New York, 10027, USA
# 2Department of Plant Sciences, University of California, Davis, California, 95616, USA
# 3Forest and Rangeland Ecosystem Science Center, United States Geological Survey, Corvallis, Oregon, 97331, USA
# 4Department of Integrative Biology, University of Texas, Austin, Texas, 78712, USA
# *Corresponding author: sk4220@columbia.edu


library(deSolve)
source("SKG_theoreticalmodel_mainfunction.R")
source("SKG_theoreticalmodel_mainparameters.R")
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
