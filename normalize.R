#dataset= lista contenete training e test ottenuti 
#utilizzando la funzione split

normalize <- function(dataset){
  data_train <- dataset$training_set[,2:(ncol(dataset$training_set)-1)]
  y_train <- dataset$training_set[,ncol(dataset$training_set)]
  c_train <- dataset$training_set[,1]
  
  data_test <- dataset$test_set[,2:(ncol(dataset$test_set)-1)]
  y_test <- dataset$test_set[,ncol(dataset$test_set)]
  c_test <- dataset$test_set[,1]
  
  #Normalizzo il dataset nell'intervallo [-1,1]
  a <- -1
  b <- 1
  scaled_training_set <- apply(data_train, 2, function(x){
    x <- a + (x - min(x))*(b-a)/(max(x) - min(x))
  })
  scaled_test_set <- apply(data_train, 2, function(x){
    x <- a + (x - min(x))*(b-a)/(max(x) - min(x))
  })
  
  prova <- a + (data_train[1,1] - min(data_train[,1]))*(b-a)/(max(data_train[,1])-min(data_train[,1]))
  print(prova)
  output <- list(c_train,scaled_training_set,y_train,c_test,scaled_test_set,y_test)
  names(output) <- c("C_train","scaled_training","label_train","C_test","scaled_test","label_test")
  return(output)
  
}