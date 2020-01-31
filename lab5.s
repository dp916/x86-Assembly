# lab5.s
# Danny Pham

# Assemble	as -o  lab5.o lab5.s
# Link		ld -o a.out lab5.o csc35.o
# Execute	a.out	

.data

Yah:
	.ascii "\n\nEnter some gibberish words.\n\0"

Rubbish:
	.space 35

Smooth:
	.ascii "\nLet's translate this.\n\n\0"


.text
.global _start

_start:
	mov     $Yah, %rax
	call	PrintCString
					# Prompt the user to enter a string	
	mov	$35, %rbx
	mov	$Rubbish, %rax
	call	ScanCString
					# Get length of string and store it in r8
	call	LengthCString
	mov	%rax, %r8

	mov	$Smooth, %rax
	call	PrintCString
					# Subroutine Xanny
	call	Xanny
					# Complete program
	call	EndProgram


					# Save registers to stack
Xanny:
	push	%rax
	push	%rbx
	push	%r8

	mov	$0, %rdi	
					# Check each character and determine if its upper or lower case
Scheme:
	cmp	%r8, %rdi
	jg	Halo

	movb	Rubbish(%rdi), %al
					# If upper case then go to replace letter
	cmp	$97, %al
	jl	Uppercut
					# Continue loop if lower case
	add	$1, %rdi
	jmp	Scheme
					# If not a letter then increment to next character
Uppercut:
	cmp	$64, %al
	jl	Increment
					# Adding 32 to current value converts upper case to lower case
	add	$32, %al
	movb	%al, Rubbish(%rdi)

	add	$1, %rdi
	jmp	Scheme

Increment:
	add	$1, %rdi
	jmp	Scheme
					# Print the translated phrase
Halo:
	mov	$Rubbish, %rax
	call	PrintCString
					# Restore registers from the stack
	pop	%r8
	pop	%rbx
	pop	%rax
					# End of Xanny subroutine
	ret
