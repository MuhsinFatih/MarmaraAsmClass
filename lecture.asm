TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data

	money	dword	200,100,50,20,10,5,1
	str1	byte	"Enter the money:",0

.code
main PROC
	
again:
	mov edx, offset str1
	call writestring
	call readint	;money in eax

	sub eax, 0
	js again

	mov ecx, lengthof money
	mov ebx, 0
	start:
		mov edx, 0
		div money[ebx]
		
		call writedec
		mov al, 'x'
		call writechar
		mov eax, money[ebx]
		call writedec
		
		call crlf
		mov eax, edx
		add ebx, 4


		loop start
	
	

	exit

main ENDP
END main