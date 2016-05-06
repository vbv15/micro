.model small
.386
.data
dividend dw 1234H, 5678H
divisor dw 270FH
Q dw ?
R dw ?
.code
.Startup
mov ax, @data
mov ds, ax
       mov si, 0000H
       mov dx, dividend[si]
       mov ax, dividend[si+2]
       mov cx, divisor
       div cx 
       mov R, dx
       mov Q, ax
.exit
end
       