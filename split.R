split <- function(dataset){
  set.seed(123)
  #Il dataset è diviso in training set composto dalle prime 4 parole
  #e test set composto dalle ultime 2 parole
  last_row <- 120*5*4
  training_index <- 1:last_row #iterazioni * carattere * parola
  training_set <- dataset[training_index,]
  test_set <- dataset[-training_index,]

  #shuffle? serve a qualcosa? 
  #training_set <- training_set[sample(nrow(training_set)),]
  #test_set <- test_set[sample(nrow(test_set)),]
  
  data_split <- list(training_set,test_set)
  names(data_split) <- c("training_set","test_set") 
  return(data_split)
}