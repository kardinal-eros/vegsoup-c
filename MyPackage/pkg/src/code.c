/*	as.numeric return int */
/*	as.character char */
/*	as.binary bool */

#include <R.h>
#include <Rinternals.h>
SEXP out(SEXP x, SEXP y) {	

	
	R_len_t i, j, nx = length(x), ny = length(y);
	double tmp, *rx = REAL(x), *ry = REAL(y), *rans;
	
	SEXP ans, dim, dimnames, class;
	
	PROTECT(ans = allocVector(REALSXP, nx*ny));
	rans = REAL(ans);
	for(i = 0; i < nx; i++) {
	tmp = rx[i];
	for(j = 0; j < ny; j++)
		rans[i + nx*j] = tmp * ry[j];
	}
	PROTECT(dim = allocVector(INTSXP, 2));
	INTEGER(dim)[0] = nx;
	INTEGER(dim)[1] = ny;
	setAttrib(ans, R_DimSymbol, dim);
	PROTECT(dimnames = allocVector(VECSXP, 2));
	SET_VECTOR_ELT(dimnames, 0, getAttrib(x, R_NamesSymbol));
	SET_VECTOR_ELT(dimnames, 1, getAttrib(y, R_NamesSymbol));
	setAttrib(ans, R_DimNamesSymbol, dimnames);
	PROTECT(class = allocVector(STRSXP, 1));
	SET_STRING_ELT(class, 0, mkChar("matrix")); classgets(ans, class);
	UNPROTECT(4);
	return(ans);
}	