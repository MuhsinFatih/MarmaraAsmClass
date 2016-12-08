TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov al, 85h
	sar al, 1	; shift arithmetic right

	; 11000010 1
	;		-->
	; AL = c2h = -62
	; C 1
	; S 1
	; Z 0
	; O 0




	exit

main ENDP
END main