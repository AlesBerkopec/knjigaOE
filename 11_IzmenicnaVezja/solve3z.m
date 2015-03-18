# resi trifazni sistem v zvezdi
# ce je length(ZZ)=3, je brez nicelnega vodnika, ce lenght(ZZ)=4 potem z
# smer: pozitiven sistem=True=1, negativen=False=-1
# vrnemo Vz=potencial zvezdisca, in tokove po fazah (in nicelnem, ce je)
# UU so napetosti med fazami in zvezdiscem
# VA=Vabs, fiA=0 (VA=Vabs/ef+j*0)
function [Vz,UU,II]=solve3z(ZZ,Vabs,smer)
 if (smer==0.0)
	 smer=1;
 endif
 smer=smer/abs(smer);

 ff=[0,-smer*2*pi/3,smer*2*pi/3];
 VV=Vabs.*(cos(ff)+sin(ff)*j);
 VV=[VV,zeros(1,length(ZZ)-3)];
 #ppolar(VV,'V')

 n0=sum(ZZ==0.0);
 if (n0 > 1)
  disp('(x) solve3z: napaka, vec kot ena impedanca = 0 => nekorektno vezje.')
  exit;
 elseif (n0==1)
  i0=find(ZZ==0.0);
  Vz=VV(i0);
  ZZ(i0)=inf;
  UU=VV-Vz;
  II=UU./ZZ;
  II(i0)=-sum(II);
 else
  s=sum(1./ZZ);
  Vz=sum(VV./ZZ)/s;
  UU=VV-Vz;
  II=UU./ZZ;
 endif
endfunction
