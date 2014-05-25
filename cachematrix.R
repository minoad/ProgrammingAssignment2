## Put comments here that give an overall description of what your
## functions do.  touch
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    #create the structure
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    
    get <- function(){ 
        x
    }
    
    setinv <- function(inv){ 
        i <<- mean
    }
    
    getinv <- function(){
        i
    }
    browser()
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i<-x$getinv
    if(!is.null(i)){
        print("cache hit")
        print(i)
        return(i)
    }
    else{
        print("no cache")
    }
    #get the raw data
    rmat <- x$get()
    #perform some thing on the raw data
    inv <- x #here is where we invert
    
    #update the custom varialbe with the data
    x$setinv(inv)
    browser()
    #return the data
    inv
}
