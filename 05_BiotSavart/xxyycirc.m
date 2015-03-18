function [xx,yy]=xxyycirc(r,n)
	dfi=2*pi/n;
	ffi=linspace(0,2*pi-dfi,n);
	xx=r*cos(ffi);
	yy=r*sin(ffi);
endfunction
