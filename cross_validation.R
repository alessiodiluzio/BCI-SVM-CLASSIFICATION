cross_validation <- function(dat) {
  set.seed(123)
  
  n_classifiers <- 1:2
  n_folds <- 5
  folds <- replicate(n_folds,list())
  for(i in n_folds){
    fold <- seq(from = 60*i-59, to = 60*i, by = 1)
    folds[i] <- fold
  }
  folds <- sample(folds)
  View(folds)
  
  parameters <- lapply(n_classifiers, function(n_classifiers)matrix(0, nrow = n_folds, ncol = 4))
  names(parameters) <- c("Linear_SVM","Gaussian_SVM")
  
  for (k in 1:n_folds) {
    
    test_i <- folds[k]
    train <- dat$scaled_training[-test_i, ]
    test <- dat$scaled_training[test_i, ]
    
    label_train <- dat$label_train[-test_i]
    label_test <- dat$label_train[test_i]
    
    parameters$Linear_SVM[k,] <- linear_SVM(train,label_train,test,label_test)
    parameters$Gaussian_SVM[k,] <- gaussian_SVM(train,label_train,test,label_test)
  }
  
  mean_parameter <- lapply(parameters, function(x){
    x <- replace(x, is.na(x), 0)
    parameter_mean <- apply(x,2,mean)
    return(parameter_mean)
  })
  
  my_output <- do.call("rbind",mean_parameter)
  colnames(my_output) <- c("Avg_Accuracy","Avg_TPRA","Avg_TPRB","Avg_TPRx")
  return(my_output)
}