TITLE Program Template     (template.asm)
; Project2
; Muhsin Fatih Yorulmaz
; 150714007
; note: max allowed number is the size of matrix instead of 10, which is also scalable


INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
matrixSize EQU 20							;for easier change later. For example for matrix size = 20 -> matrix is 20x20
; matrix[ebx + edi]	==> matrix[i + j]	;more readable
i EQU ebx
j EQU edi
k EQU esi

prompt1		byte		"~What do you want to find in this matrix?", 0ah, "~I want to find: ",0
input		byte		128 dup(0),0	; input size of 128 at max
Linput		dword		0					; input length
matrix		byte		matrixSize dup(matrixSize dup(0)),0
colors		byte		matrixSize dup(matrixSize dup(lightgray)),0
muhsinfatih	byte		"muhsinfatih",0
hitafnishum	byte		"hitafnishum",0		; 'muhsinfatih' in reverse order
clrScrByte	byte		15000 dup(" "),0	; to further clear screen
occurances	dword		0
conclusion	byte		"There are ",0
conc2		byte		" occurance(s) of your input in the matrix",0

.code ; ************** code **************


readstr MACRO str
	push ecx
	mov edx, offset str
	mov ecx, lengthof str-1
	call readstring
	pop ecx
ENDM
endfor MACRO goto					; same as loop but only doesn't throw jump dest too far error
	dec ecx
	jne goto
ENDM
printdec MACRO decimal
	push eax
	mov eax, decimal
	call writedec
	pop eax
ENDM

printMatrix PROC
call crlf
mov eax, 0
mov ecx, matrixSize
mov i, 0
printloop:
	push ecx
	mov ecx, matrixSize
	mov j,0
	printloop2:
		mov al, colors[i + j]
		call settextcolor
		mov al, matrix[i + j]
		call writechar
		mov al, " "
		call writechar
		inc j
		loop printloop2
	call crlf
	add i, matrixSize
	pop ecx
	loop printloop

	mov al, lightgray
	call settextcolor
	ret	;hahah. i figured out that if I uncomment this, I get the matrix in THE MATRIX movie :D
printMatrix ENDP


main PROC


mov eax, lightCyan
call settextcolor

call clrscr
call crlf
mwrite "	Find the Word Game"
call crlf

mov eax, lightgray
call settextcolor

call randomize						; make sure randoms are actually random

; build the matrix
mov i, 0							; i = 0
mov ecx, matrixSize					; while(i < matrixSize * matrixSize)
outerloop:
	push ecx						; preserve i
	mov j, 0						; j = 0
	mov ecx, matrixSize				; while(j < matrixSize)
	start1:
		; generate random lowercase char
		mov eax,26
		call randomrange
		add eax,97
		mov byte ptr matrix[i + j], al	; save the char to matrix

		inc j
		loop start1					; end for
	; call crlf
	
	pop ecx
	add i, matrixSize
	loop outerloop					; end for


mov eax, matrixSize
cmp eax, 19
jb skiptest
; for testing, fill 'muhsinfatih' in matrix 6 times in fixed positions
mov esi, offset muhsinfatih
mov ecx, 11
mov edi, offset matrix[matrixSize * 2 + 5]
REP MOVSB

mov esi, offset hitafnishum
mov ecx, 11
mov edi, offset matrix[matrixSize * 4 + 1]
REP MOVSB

mov esi, offset muhsinfatih
mov ecx, 11
mov edi, offset matrix[matrixSize * 6 + 1]
REP MOVSB

mov esi, offset hitafnishum
mov ecx, 11
mov edi, offset matrix[matrixSize * 15]
REP MOVSB

mov ecx, 11
mov i, matrixSize
imul i, 8
mov j, 0
crosstest:
	mov al, muhsinfatih[j]
	mov matrix[i + j + 5], al
	add i, matrixSize
	inc j
	loop crosstest

mov ecx, 11
mov i, matrixSize
imul i, 7
mov j, 0
crosstest2:
	mov al, muhsinfatih[j]
	mov matrix[i + j + 7], al
	add i, matrixSize
	inc j
	loop crosstest2

; --------------------------------------------------------------------
skiptest:
invoke printMatrix
call crlf
mwrite "(Can you see muhsinfatih's in the matrix? There are 6 of them :) )"
prompt:
mov eax, lightgray
call settextcolor
call crlf
; prompt user to enter text
mov edx,offset prompt1
call writestring

readstr input						; read input
mov Linput, eax						; store input size
push eax

; check if input is valid
cmp eax, 3
jae valid1
mov eax, lightRed
call settextcolor
mwrite "Please enter least 3 characters"
call crlf
mov eax, lightgray
call settextcolor
jmp prompt
call crlf

valid1:

pop eax
cmp eax, matrixSize
jb valid2
mov eax, lightRed
call settextcolor
mwrite "Input is longer than matrix dimensions. Enter less than "
mov eax, matrixSize
call writedec
mwrite " chars."
mov eax, lightgray
call settextcolor
mov input, 0 ; fix the input

jmp prompt

valid2:
mov ebx, 0
mov ecx, Linput
mov esi, 0
lcase:
	or input[esi], 020h		; convert string to lowercase
	mov bl, input[esi]
	cmp bl, 97
	jae valid3

	;call writedec
	mov eax, lightred
	call settextcolor
	mwrite "Invalid character. Only letters are allowed"
	call crlf
	jmp prompt
	
	valid3:
	
	cmp bl, 122
	jbe valid4
	mov eax, lightred
	call settextcolor
	mwrite "Invalid character. Only letters are allowed"
	call crlf
	jmp prompt
	
	valid4:
	
	inc esi
	loop lcase





; *** begin search ***

mov i, 0
mov ecx, matrixSize
for1:
	push ecx
	mov j, 0
	mov ecx, matrixSize
	for2:
		push ecx
		
		; check if the first character matches
		movzx eax, matrix[i + j]
		cmp al, input	; no offset ==> first char
		jne noMatch		; continue. no match at all


		; linear search

		mov ebp, j
		add ebp, Linput
		cmp ebp, matrixSize
		ja noMatch1		; input length > remaining columns

		
		mov ecx, Linput	; while (j < input length)
		push j
		mov k, j
		for3:
			mov al, matrix[i + j]
			sub j, k
			cmp al, input[j]
			
			je match
			pop j
			jmp noMatch1
			match:
			add j, k
			inc j
			loop for3
		
		
		; found! add color to color table
		inc occurances
		mov ecx, Linput
		mov j, k
		for4:
			mov colors[i + j], lightGreen
			inc j
			loop for4
		
		pop j






		noMatch1:	; did not find linear match

		; linear backwards search

		mov ebp, j
		sub ebp, Linput
		cmp ebp, -1		; Linput - 1
		jl noMatch2		; input length > remaining columns on the left

		
		mov ecx, Linput	; while (j < input length)
		push j
		mov k, 0
		for1_3:
			mov al, matrix[i + j]
			sub j, k

			
			cmp al, input[k]
			

			je match2
			pop j
			jmp noMatch2
			match2:
			
			add j, k
			dec j
			inc k
			loop for1_3
		
		
		; found! add color to color table
		inc occurances
		mov ecx, Linput
		inc j
		for1_4:
			mov colors[i + j], lightRed
			inc j
			loop for1_4
		
		pop j


		noMatch2:

		

		; cross search

		mov ebp, j
		add ebp, Linput
		cmp ebp, matrixSize
		ja noMatch		; input length > remaining columns
		
		
		mov edx, 0
		mov eax, i
		mov ebp, matrixSize
		div ebp			; divide i by matrixSize
		
		mov ebp, eax
		add ebp, Linput
		call crlf
		cmp ebp, matrixSize

		ja noMatch; input length > remaining rows
		

		

		mov ecx, Linput	; while (j < input length)
		push j
		mov ebp, i		; store i in ebp to use for coloring
		push i
		mov k, j
		for2_3:
			mov al, matrix[i + j]
			sub j, k
			cmp al, input[j]
			
			je match3
			
			pop i
			pop j
			jmp noMatch
			match3:
			;mwrite "match"
			add j, k
			inc j
			add i, matrixSize
			loop for2_3
		
		
		; found! add color to color table
		inc occurances
		mov ecx, Linput
		mov j, k
		mov i, ebp		; get i back to first index
		for2_4:
			mov colors[i + j], yellow
			inc j
			add i, matrixSize
			loop for2_4
		
		pop i
		pop j
		



		noMatch:	; no match at all
		pop ecx
		inc j
		endfor for2
	pop ecx
	add i, matrixSize
	endfor for1


call clrscr
mov edx, offset clrScrByte
call writestring			; make sure screen is actually cleared (sort of..)
call clrscr

mov eax, lightCyan
call settextcolor

call crlf
mwrite "	Find the Word Game"
call crlf

mov eax, lightgray
call settextcolor

; print the matrix
invoke printMatrix

mov eax, lightCyan
call settextcolor

call crlf
mov edx, offset conclusion
call writestring
printdec occurances
mov edx, offset conc2
call writestring

mov eax, lightGray
call settextcolor
call crlf
call crlf
mwrite "Note: This matrix is scalable. You can go to code and change the matrixSize constant. It works on all sizes. However there are no prewritten muhsinfatih's in matrix smaller than 19x19 matrices"

mov ecx, occurances
cmp ecx, 0
jle exitSound		; if there are occurances, play sound
mov al, 7
call writechar
exitSound:

call crlf
mov eax, lightCyan
call settextcolor

w2cont:
mwrite "Do you want to continue(y/n)?"

readStr input
cmp input, 'y'
jne eif

mov occurances, 0

mov ecx, matrixSize
mov eax, ecx
mul ecx
mov ecx, eax
mov i, 0
resetColors:
	mov colors[i], lightGray
	inc i
	loop resetColors
call clrscr
mov edx, offset clrScrByte
call writestring			; make sure screen is actually cleared (sort of..)
call clrscr

mov eax, lightCyan
call settextcolor

call clrscr
call crlf
mwrite "	Find the Word Game"
call crlf

mov eax, lightgray
call settextcolor

call printMatrix

jmp prompt


eif:
cmp input, 'n'
jne w2cont

exitJump:
exit	
main ENDP

END main
