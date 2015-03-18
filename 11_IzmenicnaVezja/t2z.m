function [ZZz]=t2z(ZZt)
# pretvorba trikotne (delta) vezave v zvezdo (Delta -> Y)
# ZZz(1) iz spojisca A, ZZt(1) med spojiscema B in C
 zts=sum(ZZt);
 ZZz=shift(ZZt,2).*shift(ZZt,1)./zts;
endfunction
