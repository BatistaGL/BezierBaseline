% Calculates a Bezier curve of any order in any dimension.
%
%
% bz = AnyOrderBezier( coef )
%
%	bz		Matrix of calculated data from points
%
%	coef		Matrix containing Coefficients of the curve
%			The number of rows is the Bezier curve order
%			and the number of columns is the dimension
%			in which the curve was constructed
%
%
% Special thanks to Mike "Pomax" Kamermans, who made this tutorial
% http://pomax.github.io/bezierinfo/
% Which made this work (and some understanding of the subject) possible! 
	
function bz = AnyOrderBezier(coef);
	warning ("off", "Octave:broadcast");
	n = size(coef)(1);				
	t = [0: .01: 1]';					
	pa = pascal(n, -1)(n, :);		
	xp = [0 :length(pa) - 1];			
	t1 = t .^ xp;
	t2 = (1 - t) .^ fliplr(xp);
	bz = (t1 .* t2 .* pa) * coef;
	warning ("error", "Octave:broadcast");
end
