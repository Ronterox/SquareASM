[org 0x7C00]

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    mov al, 0x13 ; 320x200
    int 0x10

    mov edi, DRAW_START
    call .draw_line

    jmp $

.draw_line:
    xor ecx, ecx
    call .put_pixel
    call .move_down
    call .put_pixel
    ret

.move_down:
    add edi, 320
    jmp .put_pixel
    ret

.put_pixel:
    mov byte [edi], COLOR_RED
    inc edi
    inc ecx
    cmp ecx, sq_width
    jl .put_pixel
    ret

sq_width equ 64
sq_height equ 32

DRAW_START equ 0XA0000
COLOR_RED equ 0X04

times 510-($-$$) db 0
dw 0xAA55

