TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	; unsigned division (div)
	; div x	(r/m)
	; x -> 32bit

	mov edx, ebx
	shr edx, 16
	mov ax, bx
	
	; OR

	mov ax, bx
	shr ebx, 16
	mov dx, bx

	; OR
	
	; ebx = 12345678h
	push ebx
	pop ax ; ax = 5678h
	pop dx ; dx = 1234h

	exit

main ENDP
END main