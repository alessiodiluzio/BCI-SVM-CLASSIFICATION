split <- function(dataset){
  set.seed(123)
  #Il dataset è diviso in training set composto dalle prime 5 parole
  #e test set composto dall'ultima parola
  v <- list(1,2,3,4,5)
  x <- sample(v,1)
  test_index = seq(60*i+1,60*(i+1),by=1)
  training_set <- dataset[-test_index,]
  test_set <- dataset[test_index,]
  data_split <- list(training_set,test_set)
  names(data_split) <- c("training_set","test_set") 
  return(data_split)
}