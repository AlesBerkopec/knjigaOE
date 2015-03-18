function [xx,yy]=xxyysquare(a,n)
	ll=linspace(0,a,n)-0.5*a;
	xx=[ll(1:end-1),0.5*a*ones(1,n-1),-ll(1:end-1),-0.5*a*ones(1,n-1)];
	yy=[-0.5*a*ones(1,n-1),ll(1:end-1),0.5*a*ones(1,n-1),-ll(1:end-1)];
endfunction
