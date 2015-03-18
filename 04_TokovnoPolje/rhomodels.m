function rhomodels(m)
# m=1: linearni, m=2 kvadratni, m=3 kubicni model
# m=1 in m=3 le en rezultat, m=2 trije rezultati (za [1,2], [2,3], [3,1]
# T v celzijih, rho v Ohm*m
T0=20;
r0=2.44e-6;
TT=[85.9,203.5,430.0];
rr=[2.60,3.15,5.73]*1e-6;
xx=TT/T0-1;
yy=rr/r0-1;
[xx',yy']
if (m==1)
	aa=yy./xx;
	aalpha=aa/T0;
[aa',aalpha']
elseif (m==2)
	for i=1:3
	 j=rem(i,3)+1;
	 #i,j
	 AA=[xx(i),xx(i)^2;xx(j),xx(j)^2];
	 BB=[yy(i);yy(j)];
	 XX=AA\BB;
	 aa(i)=XX(1);
	 bb(i)=XX(2);
	endfor
	aalpha=aa/T0;
	bbeta=bb/(T0^2);
[aa',bb',aalpha',bbeta']
elseif (m==3)
	AA=[xx',xx'.^2,xx'.^3]
	yy'
	XX=AA\yy';
	a=XX(1)
	b=XX(2)
	c=XX(3)
	aalpha=a/T0
	bbeta=b/T0^2
	ggama=c/T0^3
else disp('napaka, m<1 ali m>3');
endif
endfunction
