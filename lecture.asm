TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

	var1	word	5

.code
main PROC
	
	; bx / al

	mov bx, 800h
	mov al, 10h

	mov cl, al
	mov ax, bx

	div cl

	call dumpregs
	

	exit

main ENDP
END main