setGeneric("MyMethodCallExternalCode", function(object, mode, ...)
	standardGeneric("MyMethodCallExternalCode"))
	
setMethod("MyMethodCallExternalCode",
    signature(object = "MyClass"),
	function (object, ...) {
		
		if (missing(mode)) mode <- 1
		
		if (mode == 1) type <- "numeric"
		if (mode == 2) type <- "character"
		if (mode == 3) type <- "logical"								
		
		plot <- slot(object, "species")$plot
		abbr <- slot(object, "species")$abbr
		layer <- slot(object, "species")$abbr
		cov <- slot(object, "species")$cov
		
		#	for testing
		#	two vectors of random numbers of length 10
		x <- rnorm(10); y <- rnorm(10)		
		
		res <- .Call("out", x, y, PACKAGE = "MyPackage")
				
#		res <- .Call("testcode",
#			plot = as.character(plot),
#			abbr = as.character(abbr),
#			layer = as.character(layer),
#			cov = as.character(cov),
#			mode = as.integer(mode),
#			PACKAGE = "MyPackage")
		
		return(res)
	}
)