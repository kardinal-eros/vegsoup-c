setGeneric("MyMethodRversion", function(object, mode, ...)
	standardGeneric("MyMethodRversion"))
	
setMethod("MyMethodRversion",
    signature(object = "MyClass"),
	function (object, ...) {
		#	object = dta; mode = 2
		
		if (missing(mode)) mode = 3
				
#		cpu.time <- system.time({
	
		#	slots
		plot <- slot(object, "species")$plot
		abbr <- slot(object, "species")$abbr
		layer <- slot(object, "species")$layer
		cov <- slot(object, "species")$cov
		scale <- slot(object, "scale")
	
		#	matrix dimensions
		plots <- unique(plot)
		species.layer <- paste(abbr, layer, sep = "@")	
		species <- sort(unique(species.layer))
		
		#	cover transformation
		if (mode == 1 & scale$scale != "frequency") {
			cov <- factor(cov, levels = scale$codes, labels = scale$lims)
			if (any(is.na(cov))) stop("scale codes do not perfectly match data" )
		}
#		})
#		cat("\n init time objects", cpu.time[3], "sec")
		if (mode == 1) {
			cpu.time <- system.time({	
			m <- t(vapply(plots,
				USE.NAMES = FALSE,
				FUN.VALUE = numeric(length(species)),
				FUN = function (x) {
					r <- numeric(length(species))
					r[species %in% species.layer[plot == x]] <- cov[plot == x]
					r
				}))
			dimnames(m) <- list(plots, species)		
			})
		}

		if (mode == 2) {
			cpu.time <- system.time({	
			m <- t(vapply(plots,
				USE.NAMES = FALSE,
				FUN.VALUE = character(length(species)),
				FUN = function (x) {
					r <- character(length(species))
					r[species %in% species.layer[plot == x]] <- cov[plot == x]
					r
				}))
			dimnames(m) <- list(plots, species)		
			})
		}
		
		if (mode == 3) {
			cpu.time <- system.time({			
			m <- t(vapply(plots,
				USE.NAMES = FALSE,
				FUN.VALUE = integer(length(species)),
				FUN = function (x) {
					r <- integer(length(species))
					r[species %in% species.layer[plot == x]] <- as.integer(1)
					r
				}))
			dimnames(m) <- list(plots, species)
			})		
		}
		cat("\n time to cast matrix", cpu.time[3], "sec")		

		return(m)
	}
)