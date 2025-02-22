.section .data
cool_string: .string "gxoxk ZHGGT z1o3 rhn NI!"
offset: .byte 7

.section .text
	.global _start


_start:
	lds r16, offset
	push r16

	ldi r16, lo8(cool_string)
	push r16

	ldi r16, hi8(cool_string)
	push r16

	call caesarCypher

	ret

caesarCypher:
	in r31, 0x3e
	in r30, 0x3d

	ldd r16, Z+5 ; offset

	ldd r26, Z+3 ; arr in X
	ldd r27, Z+4

	push r16
	call mod26
	pop r16

while_start_cypher:
	ld r18, X

	cpi r18, 0
	breq end_cypher

	push r18
	call isLowerCaseLetter
	pop r19

	push r18
	call isUpperCaseLetter
	pop r20

	; 0 for neither, 1 for xor 2 for both
	; note: 2 cannot happen
	add r19, r20

	cpi r19, 0
	breq end_if_cypher

	mov r20, r18 ; letter_type

	add r18, r16
	
	cpi r18, 123
	brlo end_if_cypher

	cpi r20, 91
	brsh end_if_cypher

	cpi r19, 91
	brlo end_if_cypher

fix_letter:
	subi r18, 26

end_if_cypher:
	st X+, r18

end_cypher:
	ret

; TODO:
mod26:

	.end

