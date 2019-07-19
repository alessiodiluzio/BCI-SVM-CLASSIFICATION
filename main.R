#--------- PREDICTING HOW MUCH STO PROGETTO FA SCHIFO AL CAZZO

library("dplyr")
source("split.R")
source("normalize.R")
#source("test.R")
source("column_average.R")
source("row_average.R")
source("cross_validation.R")
source("linear_SVM.R")
source("gaussian_SVM.R")


X_df <- read.table('dataset/X.txt', header=FALSE, sep=" ", dec=".")
averaged_on_column_df <- column_average(X_df)

C_df <- read.table('dataset/C.txt', header=FALSE, sep=" ", dec=".")
C_X_df <- cbind(C_df, averaged_on_column_df)
names(C_X_df)[1] <- "C"

Y_df <- read.table('dataset/Y.txt', header=FALSE, sep=" ", dec=".")
df <- cbind(C_X_df,Y_df)

averaged_df <- row_average(df)
#c <- averaged_df[, 1]
#c1 <- averaged_df[, ncol(averaged_df)]
#View(cbind(c, c1))

data_split <- split(df)
#averaged_df <- row_average(data_split$test_set)
names(averaged_df)[ncol(averaged_df)] <- "Y"
normalized_split <- normalize(data_split)

cross_val_out <- cross_validation(normalized_split)
