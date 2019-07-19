compute_accuracy <- function(decision_values,test_label){
  output<- matrix(
    c(-1,-1,-1,-1,-1,-1),
    nrow = 6,
    ncol = 1,
    byrow = TRUE
  )
  max_index <- which.max(decision_values[1:6,1])
  output[max_index,1] <- 1
  last_index <- nrow(decision_values)/6
  for(i in 2:last_index){
    tmp_out <- matrix(
      c(-1,-1,-1,-1,-1,-1),
      nrow = 6,
      ncol = 1,
      byrow = TRUE
    )
    l <- 6*i-5
    u <-6*i
    #print(decision_values[l:u,])
    max_index <- which.max(decision_values[l:u,1])
    #print(max_index)
    tmp_out[max_index,1] <-1
    output = rbind(output,tmp_out)
  }
  true_character <- 0
  View(test_label)
  print(nrow(test_label))
  total_character <- nrow(test_label)/12
  print(true_character)
  print(total_character)
  for(i in 1:nrow(decision_values)){
    if(identical(TRUE,isTRUE(all.equal(output[12*i-11:12*i],test_label[12*i-11:12*i])))){
      true_character <- true_character + 1 
    }
  }
  
  return(true_character/total_character)
}