TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

	
.code

addition MACRO x,y
	push eax
	mov eax, x
	add eax, y
	call writeint
	pop eax
ENDM

main PROC
	
	mov ecx, 10
	mov edx, 20
	
	addition ecx, edx
	
	exit

main ENDP
END main