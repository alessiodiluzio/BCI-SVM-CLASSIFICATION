gaussian_SVM <- function(TR,YTR,TS,YTS){
  set.seed(123)
  #addestramento
  gaussian_model<-svm(x=TR,y=YTR,scale=F,type="C-classification",kernel="radial")
  #predizione sui dati di test
  test_prediction <- predict(gaussian_model,TS,decision.values=TRUE)
  decision_values <- attr(test_prediction,'decision.values')
  print(test_prediction)
  #matrice di confusione sui dati di test
  confusion_matrix<-table(predicted=test_prediction,observation=YTS)
  View(confusion_matrix)
  #nella matrice di confusione:
  #elemento [i,j] classe predetta i classe reale j
  #accuracy <- round((confusion_matrix["A","A"]+confusion_matrix["B","B"]+confusion_matrix["x","x"])/
  #                    nrow(TS),4)
  #View(test_prediction)
  #TPR_A <- round(((confusion_matrix["A","A"])/(confusion_matrix["A","A"]+confusion_matrix["B","A"]+confusion_matrix["x","A"])),4)
  #TPR_B <- round(((confusion_matrix["B","B"])/(confusion_matrix["B","B"]+confusion_matrix["A","B"]+confusion_matrix["x","B"])),4)
  #TPR_x <- round(((confusion_matrix["x","x"])/(confusion_matrix["x","x"]+confusion_matrix["A","x"]+confusion_matrix["B","x"])),4)
  return(0)
  return(c(accuracy,TPR_A,TPR_B,TPR_x))
}