#copiata da stackoverflow non ho idea di come funziona
#ma dovrebbe aggregare le colonne 12 a 12 sostituendole con la media
column_average <- function(dat){
  n <- 1:ncol(dat)
  ind <- data.frame(matrix(c(n, rep(NA, 12 - ncol(dat)%%12)), byrow=F, nrow=12))
  interval <- sapply(ind, function(x) all(!is.na(x)))
  ind <- ind[, interval]
  return(do.call(cbind, lapply(ind, function(i)rowMeans(dat[, i]))))
}

