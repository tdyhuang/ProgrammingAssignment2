 ## This function creates a special "matrix" object that
 ## can cache its inverse. And it returns a list of 4 elements of functions
 ## which will set, get, this special matrix and its inverse matrix which was computed
 ## by cacheSolve function


makeCacheMatrix <- function(x = matrix()) {

}
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) m <<- inverse
    getInverse <- function() m
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


 ## This function computes the inverse of the special "matrix"
 ## returned by makeCacheMatrix above. If the inverse has 
 #  already been calculated (and the matrix has not changed),
 #  then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
