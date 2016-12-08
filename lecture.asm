TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	;ror (rotate right)
	;ror dest, counter

	mov al, 0A9h
	ror al, 3
	
	;10101001 --> 00110101
	;al = 35h
	; C 1
	; O 1



	exit

main ENDP
END main