TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc

INCLUDE Macros.inc

findbigger PROTO fn: dword, sn: dword

.data

	
.code
	


main PROC
	call clrscr
	mwrite "Enter the first number: "
	call readint
	mov ebx, eax		; first number in ebx
	
	mwrite "Enter the second number: "
	call readint		; second number in eax

	invoke findbigger, eax, ebx


	exit
main ENDP

findbigger PROC fn: dword, sn: dword
	push eax
	push ebx
	mov eax, fn
	mov ebx, sn
	
	cmp eax, ebx
	jge nothing
	mov eax, ebx
nothing:
	mwrite "the bigger one: "
	call writeint
	pop ebx
	pop eax
	ret
findbigger ENDP

END main