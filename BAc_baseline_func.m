% BAc_baseline_func estimates baseline from data by 3rd order Bezier Curves.
% 
% [bl, bp] = BAc_baseline_func(x, y, w, in_p);
% 
%
% x		Independent data for analysis
% y		Dependent data for analysis
% w		Weights to be used on baseline (optional)
% in_p	Initial regression parameters  (optional) 
% 		(2x2 matrix, [x(1), y(1) ; x(2), y(2)])
%
% OUTPUT:
% bl	Calculated baseline
% bp	Control points of Bezier Curves

function [bl, bp] = BAc_baseline_func(x, y, w = x < -1.65 | x > -1.45, in_p = [-1.7, 0; -1.6, 0]);
	bezier_f   = @(x, y, p) AnyOrderBezier([x(1), y(1); p; x(end), y(end)]);
	baseline_f = @(x, y, p) interp1(bezier_f(x, y, p)(:, 1), ...
					bezier_f(x, y, p)(:, 2), x, "extrap");
	min_func = @(param) sum(((y - baseline_f(x, y, param)) .* w).^2);
	bp = fminunc(min_func, in_p);
	bl = baseline_f(x, y, bp);
end
