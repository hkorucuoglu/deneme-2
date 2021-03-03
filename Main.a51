#include <ADUC841.H>
		org		0000h
	sjmp		main
main:
	mov		dptr,#tablo
	mov		P1,#01h
	jb		p3.2,$	// buton basilma kontrolü
	jnb		p3.2,$	// butondan çekilme kontrolü
	acall	funct
	sjmp	main
funct:
	mov		R1,#08h
	mov		R0,P1	// P1->R0
	clr		c		
	mov		A,R0	// R0->A
	subb	A,#09h	// A-9
	mov		A,P2
	jnc		buyuk	// c üzerinden kontrol
kucuk:	
	mov		A,R0
	movc	A,@ A+DPTR
	mov		P2,A
	sjmp	x
buyuk:				// p2 r0 dan büyük ise dallan
	rl		A		// kaydirma islemleri
	mov		P2,A
	djnz	R1,buyuk
x:	ret
	tablo:	db	1d,2d,3d,4d,5d,6d,7d,8d,9d,10d
		end