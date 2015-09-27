## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Answer
## makeCacheMatrix is used to create a special "matrix" object which can cache its inverse.
## This function is a used to make matrix store mean data and also its inverse is stored in cache.

makeCacheMatrix <- function(x = matrix()) {
  sinv <- NULL
  
  set <- function(y)
  {
    x<<- y
    s<<- NULL
  }
  get <- function() x
  setsolve <- function(solve) 
    sinv <<- solve
  getsolve <- function() sinv
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)

}


## Write a short comment describing this function
##Answer
## This function is used to process the inverse of special "matrix" which was created and returned from makeCacheMatrix. If the matrix's value are not changed then the cachesol;ve retrieve teh invesre from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  sinv <- x$getsolve()
  if(!is.null(sinv))
  { 
    displaythismessage("cached data")
    return(sinv)
  }
  data <- x$get()
  sinv <- solve(data, ...)
  x$setsolve(sinv)
  sinv
}
x = rbind(c(1, 2), c(3, 4))
make = makeCacheMatrix(x)
make$get()

cacheSolve(make)
