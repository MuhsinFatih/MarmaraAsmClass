TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	;rcl (rotate carry left)
	;rcl dest, counter

	sub al, al ; just so we make sure carry is 0
	mov al, 93h
	rcl al, 2
	
	;10010011 --> 01001101
	;al = 4Dh
	; C 0
	; O 0



	exit

main ENDP
END main