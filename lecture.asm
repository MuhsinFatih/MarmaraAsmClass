TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

	msg1 byte "Message",0
.code

msgyaz MACRO adres
	push edx
	mov edx, offset adres
	call writestring
	pop edx

ENDM

write MACRO x
	LOCAL str1	; This prevented the previous error
	.data
		str1 byte x,0

	.code
		push edx
		mov edx, offset str1
		call writestring
		pop edx
ENDM

main PROC
	write "This is written by a macro"
	call crlf
	write "another string"	; this will NOT throw an error
	call crlf
	msgyaz msg1
	exit

main ENDP
END main