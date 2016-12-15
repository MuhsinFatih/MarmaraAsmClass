TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc

INCLUDE Macros.inc



.data

	
.code
	
	findbigger MACRO x, y
	
	mov eax, x
	cmp eax, y
	jge nothing
	mov eax, y
nothing:

	ENDM


main PROC
	call clrscr
	mwrite "Enter the first number: "
	call readint
	mov ebx, eax		; first number in ebx
	
	mwrite "Enter the second number: "
	call readint		; second number in eax

	findbigger eax, ebx

	mwrite "The bigger one: "
	call writeint

	exit
main ENDP
END main