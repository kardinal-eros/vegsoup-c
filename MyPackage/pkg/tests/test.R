library(MyPackage)

showClass("MyClass")

#	test data
#	?testdata
data(testdata)

species <- testdata
#	head(species)

#	species$plot
#	species$abbr
#	species$layer

#	abuncance scale
scale <- list(scale = "Braun-Blanquet",
	codes = c("r", "+", "1", "2m", "2a", "2b", "3", "4", "5"),
	lims = c(1, 2, 3, 4, 8, 18, 38, 68, 88))
	
#	layers
layer <- unique(testdata$layer)

res <- new("MyClass",
	species = species,
	scale = scale,
	layers = layer
)

MyMethod(res)
MyMethodCallExternalCode(res)

#	types of results

data(res_numeric)
data(res_character)
data(res_logical)

res.num <- res_numeric
res.chr <- res_character
res.log <- res_logical



