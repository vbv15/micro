.model small 
.386
.data
input db 10, 13, 'enter binary no.', '$'
output db 10, 13, 'the ascii character is', '$'
arr db ?

.code
.startup
mov ax, @data 
mov ds, ax

; input


    mov ah, 09h
    lea dx, input 
    int 21h
    
    mov bl, 00h
    mov cl, 08h
    ; counter
  
 input1:
    mov ah, 01h
    int 21h
    
    sub al, 30h
    shl bl, 1
    add bl, al
    loop input1
    mov arr, bl
 
  ;  display1:
    mov ah, 09h
    lea dx, output
    int 21h

    mov ah, 02h
    mov dl, arr
    int 21h
.exit
end
