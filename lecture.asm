TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	; signed multiplication
	; imul x (r/m)

	; x -> 8 bits
	imul bl		; ax = bl * al

	; x -> 16 bits
	imul cx		; ax = cx * ax

	; x -> 32 bits
	imul edi	; edx:eax = edi * eax

	; legal usages:
	; imul x, y		(r) / (r/m/imm)
	; x = x * y

	; imul x, y, z	(r) / (r/m) / (imm)
	; x = y * z

	imul ax, bx, 5
	imul edx, var3, 7

	imul ax, bx
	imul cx, 5
	imul ecx, var3

	exit

main ENDP
END main