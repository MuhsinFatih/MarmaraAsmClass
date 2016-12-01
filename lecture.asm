TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

array	sdword	-5,3,9,-2,-6,6,7
str1	byte	"Total of - numbers:",0
str2	byte	"Total of - numbers:",0

.code
main PROC

	mov eax, 0					; total of neg numbers
	mov ebx, 0					; total of pos numbers

	mov ecx, lengthof array
	mov edi, 0					;index for array

start:
	add array[edi],0			;sign flag will give whether x<0 or not
	js negative
	add ebx, array[edi]
	jmp continue	

negative:
	add eax, array[edi]
continue:
	add edi, 4
	loop start

	mov edx, offset str1
	call writestring
	call writeint

	call crlf

	mov edx, offset str2
	call writestring
	mov eax, ebx
	call writeint
		
	call DumpRegs

	exit

main ENDP
END main