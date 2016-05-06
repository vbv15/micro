.model small
.stack 100h
.386
.data
data1 dw 5555h
data2 dw 5555h
data3 dw 5555h
data4 dw 5555h
data5 dw 0000h
data6 dw 0000h
data7 dw 0000h
.code
.startup

        mov ax, data1
        mov bx, data2
        mov cx, data3
        mov dx, data4
        push ax
        mov al, bl 
        add al, dl
        daa
        mov dl, al
        mov al, bh
        adc al, dh
        daa
        mov dh, al
        pop ax
        adc al, cl
        daa
        mov cl, al
        mov al, ah
        adc al, ch
        daa
        mov ch, al
        mov data5, cx
        mov data6, dx
        jnc L 
        mov data7, 01h
        L:
.exit
end                           