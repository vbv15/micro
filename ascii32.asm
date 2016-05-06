.model small 
.386
.data 
mesg db 10, 13, 'enter no: $'
result db 10, 13, 'result is: $'
.code
.startup
mov ax, @data 
mov ds, ax
         lea dx,mesg
         mov AH, 09H
         INT 21H
         
	 mov ah, 01H
         int 21H
         mov bl, al
         
	 mov cl, 08H
         mov ah, 00H
         
	lea dx, result
         mov ah, 09H
         int 21H
         mov al, bl
     up: shl al, 01H
         mov bl, al
         mov al, 00H
         adc al, 30H
         mov dl, al
         mov ah, 02H
         int 21H
         mov al, bl
         dec cl
         jnz up
.exit
end