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
				
		res <- .C("testcode",
			plot = as.character(plot),
			abbr = as.character(abbr),
			layer = as.character(layer),
			cov = as.character(cov),
			mode = as.integer(mode))
		
		return(res)
	}
)