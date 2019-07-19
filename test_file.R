x<- matrix(
  c(-1,-2,-3,-4,-5,-6),
  nrow = 6,
  ncol = 1,
  byrow = TRUE
)

y<- matrix(
  c(-1,-2,-3,-4,-5,-6),
  nrow = 6,
  ncol = 1,
  byrow = TRUE
)

print(identical(x,y))

x
k<- max_index <- which(x == max(x))
k