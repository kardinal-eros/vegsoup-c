library(OpenCL)
p <- oclPlatforms()
d <- oclDevices(p[[1]])[[1]]

#	The first argument of the kernel must be __global double* for the output
#	and the second argument must be const int for the length of the output vector

code = c("
__kernel void zzz(
  __global float* output,
 const unsigned int count,
  __global float* input,
  const int nr, const int nc, const int i1, const int i2)
{
  int i = get_global_id(0);
  float dist;
  int count2, j;
  
  dist = 0;
  count2 = 0;
  for (j=0; j<nc; j++) {
   if (input[i1] && input[i2]) {
       output[i] += fabs( input[i1] - input[i2] );
           count2++;
      }
      i1 += nr;
      i2 += nr;
  }    
};")

zzz <- oclSimpleKernel(d, "zzz", code, "single")

ZZZ <- function(x, nr = 0, nc = 0, i1 = 1, i2 = 1, ...) {
	oclRun(zzz, length(x), x, nr, nc = length(x), i1, i2, ...)	
}

ZZZ(1:10)

 	
