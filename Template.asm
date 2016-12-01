TITLE Example Template     (template.asm)

INCLUDE Irvine32.inc

.data

;var1	byte	100h ;throws an initializer too large error
var1	byte	10h
var2	byte	10000101b
array1	byte	3 dup(5), 54d, -1, 'a', 2 dup('c')

.code
main PROC

mov al,	var1		;al=10b
mov bl,	var2		;bl=85h
mov cl,	array1+2	;
mov dl,	array1[4]	;

;mov var1, var2








call dumpregs

	exit	; exit to operating system
main ENDP







; (insert additional procedures here)

END main