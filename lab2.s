# lab2.s
# Danny Pham


.data
Display:
	.ascii "Gelato	: 8 carbs per cookie \nPlatinum: 6 carbs per cookie \nKrisp	: 4 carbs per cookie\n\0"

Gelato:
	.ascii "How many Gelato cookies? \n\0"

Platinum:
	.ascii "How many Platinum cookies? \n\0"

Krisp:
	.ascii "How many Krisp cookies? \n\0"

Result:
	.ascii "Wow! That's about \0"

Total:
	.ascii " carbs bro! \0"


.text
.global _start

_start:
	mov $Display, %rax
	call PrintCString

	mov $Gelato, %rax
	call PrintCString

	call ScanInt
	
	imul $8, %rax
	
	add %rax, %rbx
	
	mov $Platinum, %rax
	call PrintCString

	call ScanInt

	imul $6, %rax

	add %rax, %rbx

	mov $Krisp, %rax
	call PrintCString

	call ScanInt

	imul $4, %rax

	add %rax, %rbx

	mov $Result, %rax
	call PrintCString
	
	mov %rbx, %rax
	call PrintInt

	mov $Total, %rax
	call PrintCString
			
	call EndProgram

