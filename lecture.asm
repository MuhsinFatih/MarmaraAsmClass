TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	; unsigned division (div)
	; div x	(r/m)
	; x -> 8bit

	; ax |_x_
	; ___| al
	; ah


	div bl

	exit

main ENDP
END main