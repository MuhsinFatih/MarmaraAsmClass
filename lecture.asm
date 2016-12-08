TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov al, 40h
	shl al, 1

	; C 0
	; S 1
	; Z 0
	; O 1




	exit

main ENDP
END main