TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov eax, 0

	mov al, 20h
	mov bl, 10h

	mul bl

	call dumpregs

	exit

main ENDP
END main