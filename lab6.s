# lab6.s
# Danny Pham

# Assemble	as -o lab6.o lab6.s
# Link		ld -o a.out lab6.o
# Execute	a.out

.data

Cole:
	.ascii "I hope you have a wonderful Summer Doc!\n"

Kdot:
	.ascii "What up doe, my name is "

Camp:
	.space 35

Goat:
	.ascii "Continue my journey to reaching my full potential.\n"


.text
.global _start

_start:				# Kernal Call 1 print Cole
	mov	$1, %rax	# Linux command for Write		
	mov	$1, %rdi	# Print to screen
	mov	$Cole, %rsi	# Store address to rsi
	mov	$40, %rdx	# Move max bytes into rdx
	syscall			# Run the kernal


	mov	$1, %rax	# Kernal Call 2 print Kdot
	mov	$1, %rdi
	mov	$Kdot, %rsi
	mov	$24, %rdx
	syscall

				# Kernal Call 3 User Input
	mov	$0, %rax	# Linux command for Read
	mov	$0, %rdi	# User Input
	mov	$Camp, %rsi	# Move buffer to rsi
	mov	$39, %rdx	# Move max bytes into rdx
	syscall

				# Kernal Call 4 print Goat
	mov	$1, %rax
	mov	$1, %rdi
	mov	$Goat, %rsi
	mov	$52, %rdx
	syscall


	mov	$60, %rax	# End Program
	syscall
