assume cs:code, ds:data

data segment public
	tmp db 5 dup (?), 13, 10, '$'
data ends

code segment public
public tipar

tipar:
	push bx
	push cx
	push dx

	mov bx, offset tmp + 5
	mov cx, 10

	bucla:
		mov dx, 0
		div cx
		dec bx
		add dl, '0'
		mov byte ptr [bx], dl
		cmp ax, 0
		jne bucla

	mov dx, bx
	mov ah, 09h
	int 21h

	pop dx
	pop cx
	pop bx
	ret

code ends
end
