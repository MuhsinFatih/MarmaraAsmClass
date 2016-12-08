TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov eax, 99999999h
	mov edx, 99999999h

	mov ax, 200h
	mov bx, 100h		; result will be in dx:ax pair

	mul bx

	mov cx, dx
	shl ecx, 16
	mov cx, ax

	call dumpregs

	exit

main ENDP
END main