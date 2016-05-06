.model small
.386
.data 
data1 dw 1111H,2222H,1111H,2222H
result dw 0000H, 0000H,0000H
.code
.startup
mov di,offset data1
mov si, offset result
mov ax,[di+2]
mov bx,[di+6]
add ax,bx
mov [si+4],ax
mov ax,[di]
mov bx,[di+4]
adc ax,bx
mov [si+2],ax
jnc l1
mov bx,0
inc bx
mov [si],bx
l1 : .exit
end