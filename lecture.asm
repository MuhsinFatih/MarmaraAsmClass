TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC


call randomize

mov ecx, 100;
start:
	;	RANDOM:
	mov eax, 26
	call randomrange
	add eax, 61h	; or 97 decimal..
	call writechar
	call crlf

	loop start




	exit

main ENDP
END main