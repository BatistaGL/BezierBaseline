% BAc_treat_func makes calculations around SWV BAc AuHg data (potential and current).
% 
% [r, c, d] = BAc_treat_func(x, y, v, w);
%
% INPUT:
% x		Independent data for analysis (Base Potential)
% y		Dependent data for analysis (dCurrent)
% v		Index of variables to be used (optional)
% w		Weights to be used on baseline (see BAc_baseline_func for further information) (optional)
% 
% OUTPUT:
% r		For one argument, peak heights
% 		For more, vector of fitting parameters (see variable desc)
% 							
% c		A matrix with calculated x and y data (see variable desc)
%	
% desc	A text cell array describing variables

function [r, c, d] = BAc_treat_func(x, y, v = [5, find(x == x(end))], w = x < -1.65 | x > -1.5);
	
	x = x(v(1):v(2));
	y = y(v(1):v(2));
	w = w(v(1):v(2));
	[~, o] = sort(x);
	x = x(o);
	y = y(o);
	clear o;
	
	y_norm = @(y) (y .- y(end, :)) / (y(1, end) - y(end, end));	
	[bl, bp] = BAc_baseline_func(x, y_norm(y), w);
	[r, pk] = BAc_fitpeak_func(x, y_norm(y) - bl);

	if (nargout == 1)
		r = r(1);
	else
		printf("Returning all parameters obtained from calculations...\n");
		r = [r, reshape(bp, 1, 4), y(1), y(end)]';
		c = [x, y_norm(y), bl, pk, w];	
		desc = {"r(1): Peak Height"; 
			"r(2): Peak Position";
			"r(3): Peak Width";
			"r(4): Peak Offset";
			"r(5): Bezier p2(x)";
			"r(6): Bezier p2(y)";
			"r(7): Bezier p3(x)";
			"r(8): Bezier p3(y)";
			"r(9): Initial Current";
			"r(10): Final Current";
			"c(:, 1): Sorted x axis";
			"c(:, 2): Normalized Signal";
			"c(:, 3): Calculated Baseline";
			"c(:, 4): Guessed Peaks";
			"c(:, 5): Baseline Weights"};
	end
end
