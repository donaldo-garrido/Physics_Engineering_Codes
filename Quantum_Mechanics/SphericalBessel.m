function js = sphbes(l, x)
% calcula los armónicos esféricos de Bessel jnu(x)
% x is a vector or it may be a matrix if nu is a scalar
% if nu is a row and x a column vector, the output js is a matrix
[nnu lnu] = size(l);
[nx lx] = size(x);
xm = repmat(x, 1, lnu);
js = sqrt(pi ./(2* xm)) .* besselj(l + 0.5, x);
end