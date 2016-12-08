TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov al, -2	; al = FEh
	mov bl, 5	; bl = 05h
	call dumpregs

	; imul bl		; ax = al * bl
	
	; lets make a mistake, use unsigned multiplication
	mul bl		; ax = FEh * 05h

	call dumpregs

	exit

main ENDP
END main