xplot <- seq(-5, 5, by=0.05)

yplot1 <- exp(xplot) / (1 + exp(xplot))
yplot2 <- pnorm(xplot)
yplot3 <- 1 - exp(-exp(xplot))
yplot4 <- 1 - exp(-(1 - 0.3 * xplot)^(-1 / 0.3))
yplot5 <- 1 - exp(-(1 + 0.3 * xplot)^(1 / 0.3))

yplot4[is.nan(yplot4)] <- 1
yplot5[is.nan(yplot5)] <- 0

plot(xplot, yplot1, type="l", ylim=c(0, 1),
	 ylab="P(Y = 1)", xlab=bquote(paste("X", beta)), 
	 main="Different link functions")
lines(xplot, yplot2, lty=2)
lines(xplot, yplot3, lty=3)
lines(xplot, yplot4, lty=3, col="firebrick1")
lines(xplot, yplot5, lty=3, col="dodgerblue1")
legend("topleft", legend=c("Logistic", "Probit", "cloglog", "GEV positive shape", "GEV negative shape"), lty=c(1, 2, 3, 3, 3), col=c("black", "black", "black", "firebrick1", "dodgerblue1"))