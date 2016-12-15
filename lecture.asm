TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc

INCLUDE Macros.inc



.data

	
.code
	


main PROC
	call clrscr
	mwrite "Enter the first number: "
	call readint
	mov ebx, eax		; first number in ebx
	
	mwrite "Enter the second number: "
	call readint		; second number in eax

	call findbigger

	mwrite "The bigger one: "
	call writeint

	exit
main ENDP

findbigger PROC
LOCAL fn: dword, sn: dword
	mov fn, eax
	cmp fn, ebx

	mov ebp, 0		; this will result in an error
ret
findbigger ENDP

END main