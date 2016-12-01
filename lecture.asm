TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC


call randomize

mov ecx, 10
start:
	;	RANDOM:
	mov eax, 100
	call randomrange
	call writeint
	call crlf

	loop start




	exit

main ENDP
END main