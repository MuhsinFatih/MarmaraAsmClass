TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

	var1	word	5

.code
main PROC
	
	; bx / al
	; unsigned

	mov bx, 8011h
	mov al, 10h

	movzx cx, al
	mov ax, bx
	mov dx, 0

	div cx		; ax result, dx remainder

	call dumpregs
	

	exit

main ENDP
END main