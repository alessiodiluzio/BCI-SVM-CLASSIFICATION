row_average <- function(dat) {
  #Ordino le righe per il valore di C
  #Ovvero nel mio nuovo dataset avrò tutti i campioni prelevati per un flash della prima riga (id=1)
  #Poi tutti i campioni per il flash della seconda riga (id=2) fino a i flash per l'ultima colonna (id=12)
  #newdata <- dat[order(dat$C),]
  #Aggrego le righe del dataset 10 alla volta sostituendole colla media
  #return(aggregate(newdata,list(rep(1:nrow(newdata),each=10,len=nrow(df))),mean)[-1])

  #n <- 1:nrow(dat)
  #lapply(dat, 1, function(x) {mean(x)
  #  })
  n <- nrow(dat)/120
  tmp_mat = dat[1:120, 1:ncol(dat)]
  #View(tmp_mat)
  #View(output)
  #return(output)
  output <-aggregate(tmp_mat[,1:ncol(tmp_mat)], list(tmp_mat$C), mean)[-1]
  for( i in 2:n ){
    tmp_mat = dat[120*i-119:120i, 1:ncol(dat)]
    c <- aggregate(tmp_mat[,1:ncol(tmp_mat)], list(tmp_mat$C), mean)[-1]
    output <- rbind(output,c)
  }
  #View(output[1:nrow(output),])
  return(output)
}