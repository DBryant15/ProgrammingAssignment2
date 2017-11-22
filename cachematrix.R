## 20171122 1219 DWB From what I am understading this first function will "set-up"
## the functions to do the caching and will the inversion initally. I gather this from the
## forum topic on demystifing the vector mean examples. See examples given in the afore
## mentioned forum article for examples on testing.

## 20171122 1245 DWB below creates non-invertable, square matrix.
## i.e. will produce an error 
## m1 <- matrix(2:17, nrow = 4, ncol = 4)

## 20171122 1306 DWB below creates an invertable, square matrix.
## i.e. will NOT produce an error 
## a_m2 <- c(4,7,2,6)
## m2 <- matrix(a_m2, nrow = 2, ncol = 2)
## To start testing the below this use
## test1 <- makeCacheMatrix(m2)
## test1$get()

makeCacheMatrix <- function(x = matrix()) {
  ## use the <<- operation on this function to do
  ## the caching
  ## 20171122 1321 - I was able to source this. 
  ## Look to the demystifying article on the examples
  ## as i am 
  m_cache <- NULL
  set <- function(y){
    ##20171122 1315 - If() unnessessary as instructions 
    ##specify that matrix can be assumed to be always
    ##invertable
    ##if(det(x)!=0){
    x <<- y
    m_cache <<- NULL
    ##}
    ##else
      ##message("Your square matrix is non-inverable")
  }
  get <- function() x
  setInverse <- function(solve) m_cache <<- solve
  getInverse <- function() m_cache
  list(set = set, 
       get = get, 
       setInverse = setInverse,
       getInverse = getInverse)

}

## 20171122 1219 DWB From what I am understanding this one will call
## to functions created in makeCacheMatrix() to do the actual inversion
#

cacheSolve <- function(x, ...) {
  ##this has not been test, what so ever
  ##just getting this out here to pass to
  ##be able to work with @ home
  m_cache <- x$getInverse()
  if(!is.null(m_cache)){
    message("getting cached data")
    return(m_cache)
  }
  data <- x$get()
  m_cache <- solve(data, ...)
  x$setInverse(m_cache)
  m_cache
}
