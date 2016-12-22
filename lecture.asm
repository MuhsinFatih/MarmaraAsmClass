TITLE Add and Subtract              (AddSub.asm)


INCLUDE Irvine32.inc
INCLUDE Macros.inc

findbigger PROTO fn: dword, sn: dword

.data

bstr	byte 50 dup (0),0
sstr	byte 5 dup (0),0

lbstr dword ?
lsstr dword ?

.code
main PROC

	call clrscr
	mwrite "Enter the string:"
	mov edx, offset bstr
	mov ecx, lengthof bstr -1
	
	call readstring
	mov lbstr, eax

	mwrite "Enter the substring:"
	mov edx, offset sstr
	mov ecx, lengthof sstr -1
	call readstring
	mov lsstr, eax

	cmp lbstr, eax
	jb notfound

	mov ebx, 0
	mov esi, 0

	mov ecx, lbstr
	sub ecx, lsstr
	inc ecx
	outer:
		push ebx
		mov esi, 0
		push ecx
		mov ecx, lsstr
		inner:
			mov al, bstr[ebx]
			cmp al, sstr[esi]
			jne notequal
			
			inc ebx
			inc esi

			loop inner
		
		mwrite "Found"
		mov al, 7
		call writechar
		jmp finish
		
		notequal:
		pop ecx
		pop ebx
		inc ebx
		loop outer
notfound:
mwrite "Not found"
finish:
	exit
main ENDP
END main