test <- function(){
  a <- matrix(c(0,2,1,0),nrow=2,ncol=2)
  b=makeCacheMatrix(a)
  
  cacheSolve(b)
  cacheSolve(b)
}