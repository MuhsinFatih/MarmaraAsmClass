TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov eax, 0
	mov al, 20
	mov bl, -2
	call dumpregs

	imul bl		; ax = al * bl
	
	imul ax, var1, 3		;ax = var1 * 3

	imul ax, bx				;ax = ax * bx

	call dumpregs

	exit

main ENDP
END main