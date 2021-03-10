% BAc_fitpeak_func fits one gaussian peak to data.
% 
% [r pk] = BAc_peakfit_func(x, y, param);
%
% INPUT: 							
% x	 Independent data for analysis
% y	 Dependent data for analysis
% param	 Initial regression parameters
% 
% OUTPUT:
% r	 Peak parameters [height, position, width, offset]
% pk	 Peak interpolated across x data

function [r pk] = BAc_fitpeak_func(x, y, param = [max(y), -1.57, x(11)-x(1), 0])
	GaussCurve = @(x, par) par(1) * exp(-((x - par(2)).^ 2 ) / par(3) ^ 2 ) + par(4);
	min_func = @(param) sum((y - GaussCurve(x, param)) .^ 2);
	r = fminunc(min_func, param);
	pk = GaussCurve (x, r);
end
