% logistics function
function F = logistics( t,x )
F = 1/2 - 1./( 1 + exp(t*x) );