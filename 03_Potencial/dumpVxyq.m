function dumpVxyq(fn,xmin,xmax,ymin,ymax,nx,ny,xx,yy,qq,VV,a)
   # zrcalni naboji:
    qqzrc=-qq;
    xxzrc=xx;
    yyzrc=-yy;
   # vsi naboji in njihove koordinate
    qqall=[qq;qqzrc];
    xxall=[xx,xxzrc];
    yyall=[yy,yyzrc];
    fid=fopen(fn,"w");
   [yy,xx]=meshgrid(linspace(ymin,ymax,ny),linspace(xmin,xmax,nx));
   TTx=xx(:);
   TTy=yy(:);
      for i=1:length(TTy)
         V=getVxyqqzrc(TTx(i),TTy(i),xxall,yyall,qqall',VV,a);
         fprintf(fid,"%12.5e %12.5e  %12.5e\n",TTx(i),TTy(i),V);
         if (mod(i,nx)==0) fprintf(fid,"\n");endif
      endfor
      fclose(fid);
endfunction

