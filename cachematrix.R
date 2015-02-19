## The following two functions are used to inverse a non-singular matrix and supports the concept of caching, so that the same computation of inverse]
## doesnt happen everytime when the result is required. This is achieved by storing the information in other environment through use of <<-
## also attaching test.R script that tests the below functions.


## The below function takes in a matrix and also creates a list of functions to call on the matrix including getter/setter for original matrix 
## and getter/setter for the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  inverseMat <- NULL
  ## the below function is used to return the original matrix that needs to be inversed.
  get <- function() x
  set <- function(y) {
    x <<- y
    inverseMat <<- NULL
  }
  ## the below function is used to get the inverse matrix of the original matrix which the function is being applied on.
  getinverse <- function() inverseMat
  ## the below function is used to set the inverse matrix of the original matrix which the function is being applied on.
  setinverse <- function(inverse) inverseMat <<- inverse
  
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  

}


## The following function uses the annonymous functions created in the above function and also used in-built solve function that inverses a matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverseMat <- x$getinverse()
  if(!is.null(inverseMat)) {
    message("getting cached data")
    return(inverseMat)
  }
  data <- x$get()
  inverseMat <- solve(data)
  x$setinverse(inverseMat)
  message("getting data first-time. Caching return will start from next call.")
  return(inverseMat)
}
