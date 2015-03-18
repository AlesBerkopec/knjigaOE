function [ZZt]=z2t(ZZz)
# pretvorba zvezda vezave v trikotno (Y -> Delta)
# ZZz(1) iz spojisca A, ZZt(1) med spojiscema B in C
 a=sum(ZZz.*shift(ZZz,2))
 ZZt=a./ZZz;
endfunction
