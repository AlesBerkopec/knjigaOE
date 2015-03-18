function [R,L0,g,L,Ip,JAmm2,pWmm3]=primerzn(g0,d,P,TC,aW,U)
	a=d/2;
	S=pi*a^2;
	R=U^2/P;
	L0=g0*S*R;
	g=g0/(1+aW*(TC-20));
	L=g*S*R;
	Ip=P/U;
	J=Ip/S;
	JAmm2=J*1e-6;
	p=J^2/g;
	pWmm3=p*1e-9;
endfunction
