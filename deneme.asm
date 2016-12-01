TITLE Example Template     (template.asm)

INCLUDE Irvine32.inc

.data

var1 sbyte -4,-2,3,1

.code
main PROC

mov al, var1
mov ah, [var1+1] 

call dumpregs

	exit	; exit to operating system
main ENDP
END main