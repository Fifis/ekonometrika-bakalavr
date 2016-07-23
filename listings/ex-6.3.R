set.seed(115)
n <- 100
x <- rexp(n)

log_ml <- function(lam, x) {
  sum(-dexp(x, rate = lam, log = TRUE))
}

lam_start <- 1/mean(x)
res <- nlm(f=log_ml, p=lam_start, x = x)
res$estimate

res <- nlm(f=log_ml, p=lam_start, x = x, hessian=TRUE)
fisher <- res$hessian
solve(fisher)