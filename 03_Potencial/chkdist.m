function [idx]=chkdist(xT,yT,xx,yy,a)
# ali je tocka (xT,yT) blizje kot a kateri od tock [xx,yy]?
# vrne indeks tocke, ki je blizje, sicer 0
# uporaba: (xT,yT) je tocka v mrezi, [xx,yy] so koordinate vodnikov
   dd2=(xT-xx).^2+(yT-yy).^2;
   idx=find(sign(a^2-dd2)+1);
   if (length(idx)==0)
      idx=0;
   endif
endfunction
