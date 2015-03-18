function [xx,yy]=xxyycircs(rr,nn)
	xx=[];
	yy=[];
	for k=1:length(rr)
		[xxk,yyk]=xxyycirc(rr(k),nn(k));
		xx=[xx,xxk];
		yy=[yy,yyk];
	endfor
endfunction
