org 100h

jmp mulai

msg :   db  "1-Luas Persegi",0dh,0ah,"2-Keliling Persegi",0dh,0ah,"3-Luas Persegi Panjang",0dh,0ah,"4-Keliling Persegi Panjang",0dh,0ah,'$'
msg2:   db  0dh,0ah,"Masukkan Sisi : $"
msg3:   db  0dh,0ah,"Masukkan Panjang : $"
msg4:   db  0dh,0ah,"Masukkan Lebar : $"
msg5:   db  0dh,0ah,"Error! $"
msg6:   db  0dh,0ah,"Hasil : $"
msg7:   db  0dh,0ah,'Terima kasih,Keluar dan coba lagi!',0dh,0ah,'$'
                  
                  
mulai:  mov ah,9
        mov dx, offset msg
        int 21h
        mov ah,0
        int 16h
        cmp al,31h
        je LuasPersegi
        cmp al,32h
        je KelilingPersegi
        cmp al,33h
        je LuasPersegiPanjang
        cmp al,34h
        je KelilingPersegiPanjang
        cmp al,35h
        je LuasSegitiga
        cmp al,36h
        je LuasLingkaran
        cmp al,37h
        je KelilingLingkaran
        mov ah,09h
        mov dx, offset msg5
        int 21h
        mov ah,0
        int 16h
        jmp mulai
                    
                    
LuasPersegi:   mov ah,09h
                  mov dx, offset msg2
                  int 21h
                  mov cx,0
                  call TambahMo
                  push dx
                  mov ah,9
                  mov dx, offset msg2
                  int 21h
                  mov cx,0
                  call TambahMo
                  pop bx
                  mov ax,dx
                  mul bx
                  mov dx,ax
                  push dx
                  mov ah,9
                  mov dx, offset msg6
                  int 21h
                  mov cx,10000
                  pop dx
                  call lihat
                  jmp keluar
                    
                    
TambahMo:   mov ah,0
           int 16h
           mov dx,0
           mov bx,1
           cmp al,0dh
           je FormMo
           sub ax,30h
           call LihatMo
           mov ah,0
           push ax
           inc cx
           jmp TambahMo
           

FormMo: pop ax
        push dx
        mul bx
        pop dx
        add dx,ax
        mov ax,bx
        mov bx,10
        push dx
        mul bx
        pop dx
        mov bx,ax
        dec cx
        cmp cx,0
        jne FormMo
        ret
           
           
Lihat:  mov ax,dx
       mov dx,0
       div cx
       call LihatMo
       mov bx,dx
       mov dx,0
       mov ax,cx
       mov cx,10
       div cx
       mov dx,bx
       mov cx,ax
       cmp ax,0
       jne lihat
       ret
       
       
LihatMo:    push ax
           push dx
           mov dx,ax
           add dl,30h
           mov ah,2
           int 21h
           pop dx
           pop ax
           ret
                
                
Keluar:     mov dx,offset msg7
           mov ah,09h
           int 21h
           
           mov ah,0
           int 16h
           
           ret
            
            
KelilingPersegi:   mov ah,09h
                  mov dx, offset msg2
                  int 21h
                  mov cx,0
                  call TambahMo
                  push dx
                  mov ah,09h
                  mov dx,4h
                  pop bx
                  mov ax,dx
                  mul bx
                  mov dx,ax
                  push dx
                  mov ah,9
                  mov dx, offset msg6
                  int 21h
                  mov cx,10000
                  pop dx
                  call lihat
                  jmp keluar 
                  
                  
LuasPersegiPanjang:       mov ah,09h
                           mov dx, offset msg3
                           int 21h
                           mov cx,0
                           call TambahMo
                           push dx
                           mov ah,9
                           mov dx, offset msg4
                           int 21h
                           mov cx,0
                           call TambahMo
                           pop bx
                           mov ax,dx
                           mul bx
                           mov dx,ax
                           push dx
                           mov ah,9
                           mov dx, offset msg6
                           int 21h
                           mov cx,10000
                           pop dx
                           call lihat
                           jmp keluar 
                             
                             
KelilingPersegiPanjang:    mov ah,09h
                           mov dx, offset msg3
                           int 21h
                           mov cx,0
                           call TambahMo
                           push dx
                           mov ah,9
                           mov dx, offset msg4
                           int 21h
                           mov cx,0
                           call TambahMo
                           pop bx
                           add dx,bx
                           push dx
                           mov ah,9
                           mov dx,2h
                           pop bx
                           mov ax,dx
                           mul bx
                           mov dx,ax
                           push dx
                           mov ah,9
                           mov dx, offset msg6
                           int 21h
                           mov cx,10000
                           pop dx
                           call lihat
                           jmp keluar