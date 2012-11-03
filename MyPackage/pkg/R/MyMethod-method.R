setGeneric("MyMethod", function(object, ...)
	standardGeneric("MyMethod"))
	
setMethod("MyMethod",
    signature(object = "MyClass"),
	function (object) {
		cat("object of class", class(object), "with slots:\n")
		print(slotNames(object))
		cat("\nslot species\n")
		print(head(slot(object, "species")))
		cat("\nslot scale, a list of three one-dimesional arrays\n")
		print(head(slot(object, "scale")))
		cat("\nslot layers, a one-dimesional array of layer codes\n")
		print(head(slot(object, "scale")))		
		#unique(object$layers)
	}
)