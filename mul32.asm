.model small
.386
.data
mult1 dw 2521H, 3206H
mult2 dw 0A26H, 6400H
ans dw 0H,0H,0H,0H

.code
.startup
mov ax, @data
mov ds,ax
	mov ax,mult1
	mul mult2
	mov ans ,ax
 	mov ans+2,dx
	mov ax,mult1+2
	mul mult2
	add ans+2,ax
	adc ans+4,dx
	adc ans+6,0
	mov ax , mult1
	mul mult2+2
	add ans+2,ax
	adc ans+4,dx
	adc ans+6,0
	mov ax,mult1+2
	mul mult2+2
	add ans+4,ax
	adc ans+6,dx
.exit
end