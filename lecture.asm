TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov cl, 3
	mov al, -2
	shl al, cl

	; C 1
	; S 1
	; Z 0
	; O 0





	exit

main ENDP
END main