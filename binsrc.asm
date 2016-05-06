.model small
.data
array dw 1122h, 1144h, 2222h, 3333h, 4444h
len dw 5
srckey dw 0h
sucmsg db 10, 13,'element found at position'
result db 10, 13, ?,'$'
input db 10, 13,'enter any character','$'
failmsg db 10, 13,'given element not found','$'
.code
.startup
mov cx, 04h
mov bx, 00h
mov ah, 09h
mov dx, offset input
int 21h
lab:   mov ah, 01h
       int 21h
       sub al, 30h
       shl bx, 4
       mov ah, 00h
       add bx, ax
       loop lab
       ;
mov srckey, bx
binsrc:   mov bx, 1
          mov dx, len
          mov cx, srckey
again:    cmp bx, dx
          ja failure
mov ax, bx
add ax, dx
shr ax, 1
mov si, ax
dec si
add si, si
cmp cx, array[si]
jae bigger
dec ax
mov dx, ax
jmp again
bigger:   je success 
          inc ax
          mov bx, ax
          jmp again
success:  add al, '0'
          mov result, al
          lea dx, sucmsg
          jmp display1
failure:  lea dx, failmsg
display1: mov ah, 09h
int 21h
.exit
end 