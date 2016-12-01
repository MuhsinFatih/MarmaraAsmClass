TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

array	sdword	-5,3,9,-2,-6,6,7
str1	byte	"# of even numbers:",0

.code
main PROC

	mov ecx, lengthof array
	mov ebx, 0	;index
	mov eax, 0	;counter for even numbers

start:
	test array[ebx], 00000000000000000000000000000001
	jnz cont
	inc eax
cont:
	add ebx, 4
	loop start

	mov edx, offset str1
	call writestring
	call writeint




	exit

main ENDP
END main