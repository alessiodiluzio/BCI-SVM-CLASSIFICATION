split <- function(dataset,test_dim){
  set.seed(123)
  #Il dataset è diviso in training set composto dalle prime 5 parole
  #e test set composto dall'ultima parola
  v <- 1:30
  x <- sample(v,test_dim)
  print(x)
  test_index <- (12*x[1]-11):(12*x[1])
  print(test_index)
  last_index <- test_dim
  for(i in 2:last_index){
    tmp_index <- (12*x[i]-11):(12*x[i])
    test_index <- union(test_index,tmp_index)
  }
  View(test_index)
  training_set <- dataset[-test_index,]
  test_set <- dataset[test_index,]
  data_split <- list(training_set,test_set)
  View(training_set)
  View(test_set)
  names(data_split) <- c("training_set","test_set") 
  return(data_split)
}