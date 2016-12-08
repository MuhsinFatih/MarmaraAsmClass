TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	; unsigned multiplication
	; mul x (r/m)

	; x -> 8 bit
	mul bl	; ax = bl * al

	; x -> 16 bit
	mul cx	; dx:ax = cx * ax

	;x -> 32 bit
	mul edi	; edx:eax = edi * eax

	exit

main ENDP
END main