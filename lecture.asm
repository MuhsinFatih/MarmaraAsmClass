TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	;rol (rotate left)
	;rol dest, counter

	mov al, 83h
	rol al, 1
	
	;10000011 --> 00000111
	;al = 07h
	; C 1
	; O 1



	exit

main ENDP
END main