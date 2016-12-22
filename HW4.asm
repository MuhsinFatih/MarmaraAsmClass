TITLE HW4 (hw4.asm)

; Muhsin Fatih Yorulmaz
; 150714007

INCLUDE Irvine32.inc

INCLUDE Macros.inc

playGuess PROTO secret: dword

.data

;number byte 0

finalMsg byte "Yes! You have found it. You made ",0
finalMsg2 byte " guesses to find it",0
finalMsgFirstGuess byte "only one guess to find it! Lucky you!",0


.code
main PROC

call clrscr

; generate random number and store in ebx:
call randomize
mov eax, 100
call randomrange

invoke playGuess, eax

cmp ecx, 1
jg greater
mov edx, offset finalMsg
call writestring
mov edx, offset finalMsgFirstGuess
call writestring

greater:
mov edx, offset finalMsg
call writestring

mov eax, ecx
call writedec

mov edx, offset finalMsg2
call writestring


	exit
main ENDP

; // return the number of guesses in ecx
playGuess PROC secret: dword

.data

prompt1 byte "I have chosen a random number between 0 and ",0
prompt2 byte ". Guess what it is: ",0
tooBig byte "Nope. Try a smaller one: ",0
tooSmall byte "Nope. Try a bigger one: ",0

.code
	push eax
	push edx
	mov eax, secret
	mov ecx, 1
	
	; prompt the user to enter a number
	mov edx, offset prompt1
	call writestring
		
	mov eax, secret
	call writedec
		
	mov edx, offset prompt2
	call writestring
	start:				; while (true)
		
		call readint ; read the input


		cmp eax, secret
		js smaller
		je equal
		; bigger:
			mov edx, offset tooBig
			call writestring
			jmp lp
		smaller:
			mov edx, offset tooSmall
			call writestring
			jmp lp
		equal:
			jmp breakLoop
		lp:
			add ecx, 1

		jmp start		; while loop. I guess

	breakLoop:
		pop edx
		pop eax
		ret
playGuess ENDP

END main