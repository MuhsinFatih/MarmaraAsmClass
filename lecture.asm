TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

	
.code

write MACRO x
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
	
	
	exit

main ENDP
END main