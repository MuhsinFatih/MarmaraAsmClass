TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov al, 66h
	shr al, 2

	; 00011001 10
	;		-->
	; C 1
	; S 0
	; Z 0
	; O 0




	exit

main ENDP
END main