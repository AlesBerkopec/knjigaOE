function [BB,FF]=xyI2BF(fn)
 l=1; # 1 m
 mu0=4*pi*1e-7;
 fid=fopen(fn,'r');
 aa=fscanf(fid,"%f %f %f\n",[Inf]);
 fclose(fid);
 nr=length(aa)/3;
 xyI=reshape(aa,3,nr)';
 xx=xyI(:,1);
 yy=xyI(:,2);
 II=xyI(:,3);
 xyz=[xyI(:,[1,2]),zeros(nr,1)];
 ez=[0,0,1];
 for i=1:nr
  B=[0.0,0.0,0.0];
  for k=1:nr
   if (i != k)
    rik=xyz(i,:)-xyz(k,:);
    B=B+cross(ez,rik)*xyI(k,3)/norm(rik)^2;
   endif
  endfor
  B=mu0*B/(2*pi);
  BB(i,:)=B;
 endfor

 for i=1:nr
  FF(i,:)=xyI(i,3)*cross(ez,BB(i,:))*l;
 endfor

# izdelava izhodne datoteke *BF.dat
 fnraw=strtok(fn,'.');
 fnout=strcat(fnraw,'BF.dat');
 fid=fopen(fnout,'w');
 for i=1:nr
  fprintf(fid,"%e %e %e %e %e %e %e\n",xyz(i,1),xyz(i,2),xyI(i,3),BB(i,1),BB(i,2),FF(i,1),FF(i,2));
 endfor
 fclose(fid);
endfunction
