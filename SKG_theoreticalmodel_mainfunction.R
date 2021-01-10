N_model_ode_Nfixer <- function(t,x,parms){
  with(as.list(c(parms,x)),{
    BF <- x[1]
    L <- x[2]
    A <- x[3]

    F <- max(Fmin,min(betaF/(wF*(1+gammaF*BF))-z*vF*A,Fmax))
    gF <- min(wF*(vF*A + F),betaF/(1+gammaF*BF))
    
    dBFdt <- BF*(gF-uF)
    dLdt <- uF*BF/wF - L*phi - L*m
    dAdt <- I - BF*(gF-wF*F)/wF - k*A + L*m - EF*A
    list(c(dBFdt,dLdt,dAdt))
  })
}

N_model_ode_nonfixer <- function(t,x,parms){
  with(as.list(c(parms,x)),{
    B0 <- x[1]
    L <- x[2]
    A <- x[3]

    g0 <- min(w0*v0*A,beta0/(1+gamma0*(B0)))
    
    dB0dt <- B0*(g0-u0)
    dLdt <- u0*B0/w0 - L*phi - L*m
    dAdt <- I - B0*g0/w0 - k*A +  L*m - EF*A
    list(c(dB0dt,dLdt,dAdt))
  })
}