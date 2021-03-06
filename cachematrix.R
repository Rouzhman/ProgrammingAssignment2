
# This function creates a special "matrix" object, 
# which is a list containing a function to

# set the value of the matrix
# get the value of the matrix
# set the value of the inverse of the matrix
# get the value of the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
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


## The following function calculates the inverse
# of the special "matrix" created with the above function. 
# Then, it first checks to see if the inverse has already been calculated. 
# If so, it gets the matrix inverse from the cache and skips the computation. 
# Otherwise, it calculates the matrix inverse of the data 
# and sets the value of the inverse in the cache via the setInverse function.

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
# example
f <- matrix(c(1, -2, 5, 3), 2, 2)
k <- makeCacheMatrix(f)
cacheSolve(k)
