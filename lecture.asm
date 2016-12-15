TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

	
.code

wchar MACRO x
	push eax
	mov al, x
	call writechar
	pop eax
ENDM

main PROC
	
	mov ecx, 10
	mov al, 97
	start:
		wchar al
		inc al
		loop start
	
	exit

main ENDP
END main