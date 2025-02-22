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

	ret

.end


