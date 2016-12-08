TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	;rol (rotate left)
	;rol dest, counter

	mov al, 76h
	rol al, 2
	
	;01110110 --> 11011001
	;al = D9h
	; C 1
	; O 1



	exit

main ENDP
END main