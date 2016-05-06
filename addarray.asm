.model small
.stack 100h
.data
arr1 db 55,44,44,66,22
arr2 db 11,22,33,44,55
result dw 0,0,0,0,0
len dw 5
strt dw 0000h
.code
.startup
mov si,0000h
mov di,0000h
add1: mov ax,0000h
mov bx,0000h
mov al,arr1[si]
mov bl,arr2[si]
add ax,bx
mov result[di],ax
mov ax,strt
inc ax
mov strt,ax
mov bx,10
mov dx,0000h
mov cx,0000h
mov ax,result[di]
inc si
inc di
inc di
loop1:
mov dx,0000h
div bx
push dx
inc cx
cmp ax,0000
jne loop1
push 0Ah
pop dx
mov ah,02h
int 21h
loop2:
pop dx
add dx,30
mov ah,02h
int 21h
loop loop2
mov cx,strt
mov dx,len
cmp cx,dx
jne add1
.exit
end