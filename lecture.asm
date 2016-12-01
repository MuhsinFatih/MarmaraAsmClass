TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC


call randomize
mov ebx, 1;
mov ecx, 100;
start:
	;	RANDOM:
	mov eax, 26
	call randomrange
	add eax, 61h	; or 97 decimal..
	push eax
	mov eax, ebx
	call settextcolor
	pop eax

	call writechar
	call crlf
	inc ebx

	loop start




	exit

main ENDP
END main