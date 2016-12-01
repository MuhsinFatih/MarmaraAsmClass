TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC


call randomize
mov ebx, 1;
mov ecx, 20;
mov ebx, 1
outerloop:
	
	push ecx
	mov ecx, 20
	

	start:
		mov eax, 26
		call randomrange
		add eax, 61h	; or 97 decimal..
		push eax
		mov eax, ebx
		call settextcolor
		pop eax
		call writechar
		mov al, ' '
		call writechar
		inc ebx
		loop start
	pop ecx
	call crlf
	loop outerloop




	exit

main ENDP
END main