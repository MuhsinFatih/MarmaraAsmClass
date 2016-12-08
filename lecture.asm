TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov al, 85h
	shr al, 1

	; 01000010 1
	;		-->
	; AL = 42h
	; C 1
	; S 0
	; Z 0
	; O 1




	exit

main ENDP
END main