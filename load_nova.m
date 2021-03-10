% load_nova reads data from two column data files exported by NOVA
%
% [y, x] = load_nova(file, st)
%
% INPUT:
%  file		Input filename
%  st		Starting row (optional)
%  op		Ending row (optional)
%
% OUTPUT:
%  y		2nd data column
%  x		1st data column

function [y, x] = load_nova(file, st = 6, op = 10)
	ifelse(strread(char(fread(fopen(file, 'r'))(1:3))') == '´╗┐', bom = 4, bom = 1);
	c = strread(char(fread(fopen(file,'r'))(bom:end))');	% Removes UTF8 BOM
	x = reshape(c, 2, size(c) / 2)'(st:end - op, 1);
	y = reshape(c, 2, size(c) / 2)'(st:end - op, 2);
	clear c;
	fclose(fopen(file));
end
