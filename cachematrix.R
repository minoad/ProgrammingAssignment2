#here we create the holding data structure.  depending on time i am going to try and fix the need for curr_m.  this is from a bug
makeCacheMatrix <- function(x = matrix()) {
    set <- function(y) {
        if (ncol(y)==nrow(y)){
            print("set the matrix")
            orig_mat<<-y
        }else{
            warning("must input a square matrix")
        }
        setinv(y)
    }  
    get <- function(){
        curr_m<<-x
        if(exists("orig_mat")){
            #if the cache exists and is identical to the current input, simply return it.
            if(identical(x,orig_mat)){
                print("exists and identical")
                return(orig_mat)
            }
        }else{
            warning("No matrix set or matrix out of date for inversion")
            return(x)
        }
    }
    setinv <- function(mat=orig_mat){inv_mat<<-solve(mat)}
    getinv <- function(){if(inv_mat != NULL){return(inv_mat)}else{warning("No inversion has been set")}    }
    list(set = set, get = get,setinv = setinv, getinv = getinv)
}
#this is where we set everything into the data structure.
#where the global orig_mat does not exist or is not equal to current, then set anew.
##Else, return the existing cached copy
cacheSolve <- function(x, ...) 
    {
    if( !exists("orig_mat") | (!identical(x$get(),curr_m)) ) {
        print("either not set or not identical")
        print(x$get())
        x$set(curr_m)
    }
    return(inv_mat)
    }


#quick test below.
#creates two matrixes.
#should invert and change the solutions between z and zz
z<-matrix(round(runif(9,1,100)),3,3)    
zz<-matrix(round(runif(9,1,100)),3,3)
cacheSolve(makeCacheMatrix(z))
cacheSolve(makeCacheMatrix(zz))
