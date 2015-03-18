# izpisi kompleksni vektor v polarni obliki s stopinjami
function ppolar(zz,enota)
 #aa=abs(zz)
 #ff=arg(zz)*180/pi
 for i=1:length(zz)
	 printf('%9.4f %s |_%9.4f ^%c \n',abs(zz(i)),enota,arg(zz(i))*180/pi,'o');
 endfor
endfunction
