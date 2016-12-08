TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	; signed division (div)
	; div x	(r/m)
	

	cbw ; (convert byte to word)
	; al --> ax (sign extend)
	
	cwd ; (convert word to doubleword)
	; ax --> dx:ax (sign extend)

	cdq ; (convert doubleword to quadword)
	; eax --> edx:eax (sign extend)

	div ...

	exit

main ENDP
END main