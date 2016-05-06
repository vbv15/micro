.model small
.data
array db 55h, 44h, 33h, 66h, 22h
len dw 5
srckey db 0h
sucmsg db 10, 13,'element found','$'
failmsg db 10, 13,'element not found','$'
input db 10, 13,'enrter any character','$'
.code
.startup
mov cl, 2
mov bx, 00h
mov ah, 09h
mov dx, offset input
int 21h
lab:  mov ah, 01h
      int 21h
      sub al, 30h
      shl bx, 4
      mov ah, 00h
      add bx, ax
      loop lab
mov srckey, bl
mov cx, len
mov al, srckey
mov si, 0
lin:  cmp array[si], al
      jz success
      inc si
      loop lin
lea dx, failmsg
jmp display1
success:  lea dx, sucmsg
display1: mov ah, 09h
          int 21h
.exit
end 