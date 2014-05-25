## Put comments here that give an overall description of what your
## functions do.  touch
## Write a short comment describing this function

# xx <-matrix(round(runif(9,1,100)),3,3)
# mat_x <- makeCacheMatrix()

# mat_x$set(matrix(rnorm(1:9),3,3))

makeCacheMatrix <- function(x = matrix()) {
    #create the structure
    
    set <- function(y) {
        #this is the original matrix
        if (ncol(y)==nrow(y)){
            
                orig_mat<<-y
            
        }else{
            warning("must input a square matrix")
        }
        setinv(y)
    }
    
    get <- function(){
        curr_m<<-x
        if(exists("orig_mat")){
            if(identical(x,orig_mat)){
                warning("exists and identical")
                return(orig_mat)
            }
        }else{
            warning("No matrix set or matrix out of date for inversion")
            return(x)
        }
    }
    
    setinv <- function(mat=orig_mat){ 
        #not sure why, but the default above is failing
        inv_mat<<-solve(mat)
    }
    
    getinv <- function(){
        if(inv_mat != NULL){
            return(inv_mat)
        }else{
            warning("No inversion has been set")
        }
    }
    #browser()
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) 
    {
    ## Return a matrix that is the inverse of 'x'
    #ii<-x$getinv
    #browser()
    if( !exists("orig_mat") | (!identical(x$get(),curr_m)) ) {
        print("either not set or not identical")
        
        x$set(curr_m)
        #x$set(orig)
    }
    if(exists("orig_mat"))
        {
        if(identical(x$get,orig_mat))
           {
            warning("cache is already solved.  Returning inverse")
            }
        }else{
            print("cache present, but aged.  rerunning")
            orig<-x$get()
            x$set(orig)
        }
    return(inv_mat)
    }
z<-matrix(round(runif(9,1,100)),3,3)    
zz<-matrix(round(runif(9,1,100)),3,3)
