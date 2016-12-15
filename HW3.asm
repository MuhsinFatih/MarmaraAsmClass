
; HW3
; Muhsin Fatih Yorulmaz 150714007

TITLE HW3

INCLUDE Irvine32.inc


.data

banknotes	byte 200,100,50,20,10,5,1
values		dword 7 dup(0)

prompt1 byte "Enter the number of banknotes in your hand:",0
errMsg byte "Invalid number! Enter that again",0
msgTotal byte "Total currency:",0

.code
main PROC

call clrscr
mov edx, offset prompt1
call writestring
call crlf
call crlf					;leave space for error message (visually better)


mov edx, 0					;total
mov ebx, 0					;iterator
mov ecx, lengthof banknotes	;loop counter
start:
	movzx eax, banknotes[ebx]
	call writedec			;print the banknote

	mov al, 'x'
	call writechar			;print 'x'

	call readint			;read the input for the banknote
	

	cmp eax, 0
	jl wrongNumber

	push edx				;multiplication will overwrite edx. Preserve total number
	push eax				
		mov eax, 4
		mul ebx
		mov esi, eax		;'values' is 4 bytes
	pop eax
	
	mov values[esi], eax	;store value corresponding to the current banknote

	mul banknotes[ebx]		;result will be in eax
	pop edx
	add edx, eax			;add to the total

	inc ebx					;banknotes is 1 byte since it doesnt exceed 255..
	
	loop start


jmp skip					;skip the wrongnumber function

wrongNumber:
	call clrscr

	push edx				;total number should be preserved
		mov edx, offset prompt1
		call writestring
		call crlf

		mov edx, offset errMsg
		call writestring
		call crlf
	pop edx

	push ecx					;restore counter when returning to the input loop
	neg ecx
	add ecx, lengthof banknotes	;counter = banknotes.length - counter
	mov ebx, 0					;iterator
	start2:						;print the previous numbers
		movzx eax, banknotes[ebx]
		call writedec			;print the banknote

		mov al, 'x'
		call writechar			;print 'x'
		
		mov eax, 4
		mul ebx
		mov esi, eax
		mov eax, values[esi]	;'values' is 4 bytes
		call writedec
		call crlf

		add ebx, 1
		loop start2

	pop ecx
	jmp start					; go back to the input loop

skip:
	mov eax, edx
	mov edx, offset msgTotal
	call writestring

	call writedec

	exit

main ENDP
END main