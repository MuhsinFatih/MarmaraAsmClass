TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

	
.code

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
mov ecx, 999999999
	start:
		write "T"
		loop start
	call crlf
	write "A"	; this will NOT throw an error
	
	exit

main ENDP
END main