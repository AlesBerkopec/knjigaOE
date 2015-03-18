function [V]=getVxyqqzrc(xT,yT,xxall,yyall,qqall,VV,a)
# potencial v tocki (xT,yT)
# v sistemu so zice nabojev qq(i) in potencialov VV(i)
# tukaj so zraven tudi zrcalni!
 eps0=8.854e-12;
 if (yT<0.0)
     V=0.0;
 else
    idx=chkdist(xT,yT,xxall,yyall,a);
    if (idx>0)
        V=VV(idx);
    else
        RRfac=-0.5*log((xT-xxall).^2+(yT-yyall).^2);
        VV=qqall.*RRfac;
        V=sum(VV)/(2*pi*eps0);
    endif
 endif
endfunction
