# lab3.s
# Danny Pham

# Lab 3 - Sugar Math


# Assemble	as -o lab3.o lab3.s
# Link		ld -o a.out lab3.o csc35.o
# Execute	a.out


.data

Line1:
	.ascii "How many daily units does the patient take? \0"

Line2:
	.ascii "The patient's ICF is: \0"

Line3:
	.ascii "\nWhat is the patients's blood sugar level? \0"

Line4:
	.ascii "The patient needs \0"

Line5:
	.ascii " units.\n \0"


.text
.global _start


_start:
	mov $Line1, %rax
	call PrintCString		# Display first question
	call ScanInt			# Enter daily dose
	mov %rax, %rbx			# Place number into register b
	
	mov $1800, %rax			# Place 1800 into register a
	cqo                     # Convert quad oct
	idiv %rbx, %rax			# Divide (1800 / daily dose)
	mov %rax, %rcx			# Store ICF into register c

	mov $Line2, %rax		
	call PrintCString		# Display patient's ICF
	mov %rcx, %rax			# Move ICF to register a
	call PrintInt			# Print ICF
	mov %rax, %rcx			# Place back into register c

 	mov $Line3, %rax	
	call PrintCString		# Display second question
	call ScanInt			# Enter blood sugar level

	mov %rax, %r9			# Place number into register 9
	mov %r9, %r10			# Place number into register 10
	sub $150, %r10			# Subtract (blood sugar level - 150)
	mov %r10, %r11			# Store value into register 11
			
	mov $Line4, %rax	
	call PrintCString		# Display the patient's required dose

	mov %r11, %rax			# Place value back into register a
	cqo                     # Convert quad oct
	idiv %rcx, %rax			# Divide (value / ICF)
	call PrintInt			# Print required dose
	

	mov $Line5, %rax
	call PrintCString		# Display units


	call EndProgram			# Program complete









