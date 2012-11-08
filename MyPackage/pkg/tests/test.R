library(MyPackage)

showClass("MyClass")

#	test data
#	?testdata
data(testdata)

species <- testdata
species <- read.csv2("~/Documents/vegsoup-data/windsfeld dta/species.csv",
	colClasses = "character")
	
#	head(species)

#	species$plot
#	species$abbr
#	species$layer

#	abuncance scale
scale <- list(scale = "Braun-Blanquet",
	codes = c("r", "+", "1", "2m", "2a", "2b", "3", "4", "5"),
	lims = c(1, 2, 3, 4, 8, 18, 38, 68, 88))
	
#	layers
layer <- unique(species$layer)

dta <- new("MyClass",
	species = species,
	scale = scale,
	layers = layer
)

MyMethod(dta)
res <- MyMethodCallExternalCode(dta)
res <- MyMethodRversion(dta, mode = 3)

#	types of results

data(res_numeric)
data(res_character)
data(res_logical)

res.num <- res_numeric
res.chr <- res_character
res.log <- res_logical



