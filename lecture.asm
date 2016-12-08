TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	;rcr (rotate carry right)
	;rcr dest, counter

	mov al, 97h
	add al, 83h	; C: 1
	rcr al, 3
	;al = 1Ah

	;00011010 --> 10100011
	
	; C 0
	; O 0



	exit

main ENDP
END main