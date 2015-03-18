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

# izdelava gnuplot datoteke *BF.gpt
 fngpt=strcat(fnraw,'BF.gpt');
 fid=fopen(fngpt,'w');
   fprintf(fid,'reset\n');
   fprintf(fid,'set grid\n');
   fprintf(fid,'unset key\n');
   xmin=min(xx);
   xmax=max(xx);
   #ymin=(min(yy));
   #ymax=(max(yy));
   ymin=xmin;
   ymax=xmax;
   lx=xmax-xmin;
   ly=lx; #max(ymax-ymin,2*lx);
   cr=(lx+ly)/200;
   nB=norm(BB(1,:));
   nF=norm(FF(1,:));
   for i=2:length(xx)
    nBtmp=norm(BB(i,:));
    nFtmp=norm(FF(i,:));
    if (nBtmp>nB) nB=nBtmp;endif
    if (nFtmp>nF) nF=nFtmp;endif
   endfor
   k=5;
   fprintf(fid,'set xrange [%g:%g]\n',xmin-lx/k,xmax+lx/k);
   fprintf(fid,'set yrange [%g:%g]\n',ymin-ly/k,ymax+ly/k);
   #fprintf(fid,"set style fill solid 1.0 noborder \n");
   fprintf(fid,"set style fill solid 1.0 border lt -1\n");
   fprintf(fid,"set size ratio 1\n");
   fprintf(fid,"set angles degrees\n");
   fprintf(fid,"unset border\n");
   fprintf(fid,"unset tics\n");
   kB=0.13*(lx+ly)/nB;
   kF=0.08*(lx+ly)/nF;
   for i=1:length(II)
      #fprintf(fid,'set object %d circle at %g,%g size graph %g fc rgb ',i,xx(i),yy(i),0.02);
      fprintf(fid,'set object %d circle at %g,%g size graph %g fc rgb ',i,xx(i),yy(i),0.02);
      if (II(i)<0.0) 
	      fprintf(fid,"'black'\n");
      else 
	      fprintf(fid,"'grey'\n"); 
      endif
   endfor
   for i=1:length(II)
      #fprintf(fid,'set arrow %d from %g,%g rto %g,%g lc rgb ',2*i-1,xx(i),yy(i),kB*BB(i,1),kB*BB(i,2));
      #fprintf(fid,"'orange' lw 1\n");
      fprintf(fid,'set arrow %d from %g,%g rto %g,%g lc rgb ',2*i-1,xx(i),yy(i),kB*BB(i,1),kB*BB(i,2));
      fprintf(fid,"'#878787' lt 1 lw 2\n");
      #fprintf(fid,'set arrow %d from %g,%g rto %g,%g lc rgb ',2*i,xx(i),yy(i),kF*FF(i,1),kF*FF(i,2));
      #fprintf(fid,"'forest-green' lw 3\n");
      fprintf(fid,'set arrow %d from %g,%g rto %g,%g head size screen 0.2,4 lc rgb ',2*i,xx(i),yy(i),kF*FF(i,1),kF*FF(i,2));
      fprintf(fid,"'#000000' lw 5\n");
   endfor
   fnpng=strcat(fnraw,'BF.png');fprintf(fid,"set output '%s'\n",fnpng);fprintf(fid,"set term png size 400,400\n");
   #fntikz=strcat(fnraw,'BF.tikz');fprintf(fid,"set output '%s'\n",fntikz);fprintf(fid,"set term tikz mono\n");
   
   fprintf(fid,"plot sqrt(-1) w l lw 3\n");
   fclose(fid);

endfunction
