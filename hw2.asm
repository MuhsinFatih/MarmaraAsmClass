TITLE HW2
; Muhsin Fatih Yorulmaz 150714007


INCLUDE Irvine32.inc



.data


prompt byte "Enter a string of max length 50:	",0
prompt2 byte "Enter another string of max length 50:	",0
strResult byte "Total number of matches at same indexes: ",0
strResult2 byte "There are no matches at same indexes",0

input byte 50 dup(0), 0
input2 byte 50 dup(0), 0

L1 byte 0
L2 byte 0

.code
main PROC
	mov edx, offset prompt
	call writestring
	
	mov edx, offset input
	mov ecx, offset lengthof input-1	;provide input length to function

	call readstring
	
	mov L1, al		;store length of input1

	mov edx, offset prompt2
	call writestring

	mov edx, offset input2
	mov ecx, offset lengthof input2-1	;provide input length to function

	call readstring
	
	mov L2, al		;store length of input2


	

	
	mov bl, L1
	sub bl, L2

	ja above0		;if	
		movzx ecx, L1	;L2 is bigger
		jmp endif0
	above0:				;L1 is bigger or same size
		movzx ecx, L2
	endif0:
	
	mov ah, 0		;store total number of matches in AH
	mov ebx, 0		; store index of string in ebx
	start:
		mov al, input[ebx]
		mov dl, input2[ebx]

		cmp al, dl
		jne endif1	;if
			inc ah
		endif1:


		inc ebx
		loop start

	test ah, ah
	je noMatches
		mov edx, offset strResult
		call writestring

		movzx eax, ah
		call writeint
		jmp endif2
	noMatches:
		mov edx, offset strResult2
		call writestring
	endif2:

exit

main ENDP
END main