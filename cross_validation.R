cross_validation <- function(dat,n_folds) {
  set.seed(123)
  
  n_classifiers <- 1:2
  #folds <- replicate(n_folds,list())
  #for(i in n_folds){
  #  fold <- 60*i-59:60*i
  #  folds[i] <- fold
  #}
  #folds <- sample(folds)
  #View(folds)
  
  parameters <- lapply(n_classifiers, function(n_classifiers)matrix(0, nrow = n_folds, ncol = 4))
  names(parameters) <- c("Linear_SVM","Gaussian_SVM")
  accuracy = replicate(n_folds,0)
  fold_len <- nrow(dat$scaled_training)/(n_folds*12)
  print(fold_len)
  for (k in 1:n_folds) {
    test_i <- seq(1+12*fold_len*(k-1),12*fold_len*k,by=1)
    train <- dat$scaled_training[-test_i, ]
    test <- dat$scaled_training[test_i, ]
    label_train <- dat$label_train[-test_i]
    label_test <- dat$label_train[test_i]
    accuracy[k] <- linear_SVM(train,label_train,test,label_test)
    #parameters$Gaussian_SVM[k,] <- gaussian_SVM(train,label_train,test,label_test)
  }
  
  #mean_parameter <- lapply(parameters, function(x){
  #  x <- replace(x, is.na(x), 0)
  #  parameter_mean <- apply(x,2,mean)
  #  return(parameter_mean)
  #})
  
  #my_output <- do.call("rbind",mean_parameter)
  #colnames(my_output) <- c("Avg_Accuracy","Avg_TPRA","Avg_TPRB","Avg_TPRx")
  return(accuracy)
}