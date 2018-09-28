## Put comments here that give an overall description of what your
## functions do

## We will create two functions, one of them the constructor for the new "makeCacheMatrix" object
## and another one is just a function to calculate the Inverse of the matrix

## Write a short comment describing this function
## this just loads a matrix into the new object and also creates getters and setters for both the matrix value and its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inver) inv <<- inver
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## Write a short comment describing this function
## this function just looks to see if there is a cached inverse matrix for a given matris, and either uses the cached version or
## solves the inversion and then caches the result

## to test it you can run the following code:

## THIS INITIALIZES THE OBJECTS
## test_matrix <- matrix(6:9,2,2)
## new_matrix <- makeCacheMatrix(test_matrix)

## THIS CALLS THE FUNCTION FOR FIRST TIME THUS THERE IS NOTHING CACHED
## cacheSolve(new_matrix)

## THIS CALLS THE FUNCTION FOR SECOND TIME AND YOU CAN SEE IT USES THE CACHED RESULT
## cacheSolve(new_matrix)


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  
}
