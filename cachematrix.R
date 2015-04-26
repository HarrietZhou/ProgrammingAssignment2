## The following functions create a special object that stores a matrix and caches the inverse of the matrix.

## This function creates a special 'matrix' object that can cache its inverse.It first sets the value of the matrix and gets the value of the matrix, and then sets the value of the inverse of the matrix and gets the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
	m<-NULL
	set<-function(y){
		x<<-y
		m<<-NULL
	}
	get<-function()x
	setinverse<-function(solve) m<<-solve
	getinverse<-function() m

list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## This function computes the inverse of the special 'matrix' returned by 'makeCacheMatrix' above. If the inverse has already been calculated (and the matrix has not changed), then 'cacheSolve' should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        m<-x$getinverse()
        if(!is.null(m)){
        	message("getting cached data")
        	return(m)
        }
        matrix<-x$get()
        m<-solve(matrix,...)
        x$setinverse(m)
        m
}
