#junk file for testing

#two functions
#1.  set the value of the vector
#2.  get the value of the vector
#3.  set the value of the mean
#4.  get the value of the mean
shChar <- function(x){
    sc<-function(y){
        print(c(y, x))
    }
    lc<-function(y){
        print(c(y," lc."))
    }
    list(sc=sc,lc=lc)
}


#makeTheVector
#------
#   ->set a null val
#   ->create a list that 
#   ---->call set
#   --------> supper assign y to x              #where the hell is y coming from
#   --------> super assign NULL to m
#   ---->call get
#   --------> set get equal to x 
#   ---->call setmean
#   --------> set setmean equal to function(mean) m <<- mean
#   ---->call getmean
#   --------> set getmean equal  m                   
    

#create our vector
makeVector <- function(x = numeric()) {
    m <- NULL
    print("inside makevec")
    #browser()
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function(){ 
        x
    }
    
    setmean <- function(mean){ 
        m <<- mean
    }
    
    getmean <- function(){
        m
    }
    
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}
# t is now a pointer to makeVector
# t is now a list
#### each item in the list is a fuction
######## set, get, setmean, getmean
#cachemean(makeVector(c(1,66,3,77,884)))
##   z<-c(1,66,3,66,24,5000)
##   zm<-makeVector(z)
##   cachemean(zm)

cachemean <- function(x, ...) {
    print("inside cachemean")
    
    m <- x$getmean()
    
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    else{
        message("running data alg")
    }
    #get the raw data
    data <- x$get()
    #perform some thing on the raw data
    m <- mean(data, ...)
    
    #here we set the mean by calling the matrix that was passed in, x
    #### then running the function setmean(pass in the mean  value)
    
    #update the custom varialbe with the data
    x$setmean(m)
    
    #return the data
    m
}
