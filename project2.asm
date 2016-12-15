TITLE Program Template     (template.asm)

; Program Description:
; Author:
; Date Created:
; Last Modification Date:

INCLUDE Irvine32.inc

; (insert symbol definitions here)

.data
str1 byte "enter string",0
str2 byte   11 dup(0),0
str3 byte " enter bwt 3-10",0
array byte 400 dup(0),0
matrix byte 20 dup(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),0
.code
main PROC
call clrscr


call randomize 
;mov ebx,01
mov ecx,20



outerloop:
	push ecx
	mov ecx,20
	mov edx, 0
	start1:
		mov eax,26
		call randomrange
		add eax,97

	cnt:
		mov byte ptr matrix[edx], al

		call writechar
		mov al,' '
		call writechar
		inc edx
		loop start1
	
	pop ecx

	call crlf
	inc edx
	loop outerloop


mov edx, offset matrix
add edx, 21
call writestring
call crlf

mov edx,offset str1
call writestring
mov eax,0
mov edx, offset str2
mov ecx, lengthof str2-1
call readstring
mov ebx ,eax
cmp eax,3
ja cont1

mov edx,offset str3
call writestring
exit
cont1: cmp eax,10
jb cont2

mov edx,offset str3
call writestring
exit
cont2:
	;eax uzunluk edx kelime




	exit	
main ENDP

; (insert additional procedures here)

END main
