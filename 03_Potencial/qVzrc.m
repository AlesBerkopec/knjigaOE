function [qq]=qVzrc(VV,xx,yy,a)
# prevodna ravnina pri y=0
# VV: potenciali zic v V
# xx,yy: koordinate zic (njihovi osi) v m, a je polmer zic v m
# qq: rezultat, naboji (linijske gostote) na zicah v As/m
eps0=8.854e-12;

for i=1:length(VV) 
 RR1=sqrt((xx-xx(i)).^2+(yy-yy(i)).^2);
 RR2=sqrt((xx-xx(i)).^2+(yy+yy(i)).^2);
 #zamenjamo nicle z a:
 idx = RR1 == 0;
 RR1(idx)=a;
 PP(i,:)=log(RR2./RR1);
endfor
qq=PP\VV';
qq=2*pi*eps0*qq;

endfunction
