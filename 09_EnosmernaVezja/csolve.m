function [VV]=csolve(fn)
	# fn=datoteka s trojcki (Ig,Ug,R) med spojisci (za vsako vejo)
	# spojisca grejo po vrsti, recimo primer za 
	# spojisc n=4 (A,B,C,D) in vrstic N=4*(4-1)/2=6:
	# AB: IgAB1 0 0 0 UgAB2 RAB2 0 0 RAB3
	# AC: 0 0 RAC1 0 0 RAC2
	# AD: 0 UgAD1 RAD1 0 0 RAD2
	# BC: 0 UgBC1 RBC1
	# BD: 0 0 RBD1 0 0 RBD2
	# CD: 0 0 RCD1 0 0 RCD2
	# resitev je podana v vektorju (VA,VB,VC), VD=0
 MM=dlmread(fn);
 N=size(MM)(1);
 n=0.5*(1+sqrt(1+8*N));
 AA=zeros(n-1,n-1);
 bb=zeros(n-1,1);
 [ij]=nchoosek(linspace(1,n,n),2);
 for k=1:N
	tt=reshape(MM(k,:),3,length(MM(k,:))/3)';
	t=zeros(1,3);
	for i=1:size(tt)(1)
 	 tr = tt(i,:);
 	 if (tr(1) != 0.0) t(1) += tr(1);
 	 else
	  if (tr(2) != 0.0) t(2) += tr(2)/tr(3);endif
	  if (tr(3) >  0.0) t(3) += 1/tr(3);endif
	  endif
	 endfor
	i=ij(k,1);
	j=ij(k,2);
	bb(i)+=t(1)-t(2);
	AA(i,i)-=t(3);
	if (j<n) 
		bb(j)+=-t(1)+t(2);
		AA(i,j)+=t(3);
		AA(j,i)+=t(3);
		AA(j,j)-=t(3);
	endif
 endfor
 VV=AA\bb;
endfunction
