# lab4.s
# Danny Pham

# Lab 4 - Risk Estimator

# Assemble	as -o lab4.o lab4.s
# Link		ld -o a.out lab4.0 csc35.o
# Execute	a.out

.data

Intro:
	.ascii "\n\nWelcome to the risk estimator of being hungry!\nLet's begin:\n\n\0"

Wake:
	.ascii "Did you just wake up?\n\0"

First:
	.space 2

Eat:
	.ascii "Did you eat breakfast?\n\0"

Second:
	.space 2

Stress:
	.ascii "Are you stressed out?\n\0"

Third:
	.space 2

Smoke:
	.ascii "Did you smoke ganja?\n\0"

Fourth:
	.space 2

Fast:
	.ascii "Are you fasting?\n\0"

Fifth:
	.space 2

Estimate:
	.ascii "\nYour risk estimate is \0"

Percent:
	.ascii "%\n\n\n\0"


.text
.global _start

_start:
	mov     $Intro, %rax
	call	PrintCString		# Hello

One:
	mov     $Wake, %rax
	call	PrintCString		# First question

	mov     $First, %rax		# Buffer
	call	ScanChar            # User input
	add     $20, %rcx           # Add 20 into total points  rcx = Total Points

	cmp     $'y', %al           # Compare Y with user input
	jne     Two                 # If false then jump to second question

	add     $20, %rbx           # If true then add 20 points to rbx = Points Earned

	
Two:
	mov     $Eat, %rax
	call	PrintCString		# Second Question
	
	mov     $Second, %rax		# Buffer
	call	ScanChar            # User Input
	add     $5, %rcx            # Add 5 into total points

	cmp     $'y', %al           # Compare Y with user input
	jne     Three               # If false then jump to third question

	add     $5, %rbx            # If true then add 5 points to rbx


Three:
	mov     $Stress, %rax
	call	PrintCString		# Third Question

	mov     $Third, %rax		# Buffer
	call	ScanChar            # User Input
	add     $15, %rcx           # Add 15 into total points

	cmp     $'y', %al           # Compare Y with user input
	jne     Four                # If false then jump to fourth question

	add     $15, %rbx           # If true then add 15 points to rbx


Four:
	mov     $Smoke, %rax
	call	PrintCString		# Fourth Question

	mov     $Fourth, %rax		# Buffer
	call	ScanChar            # User Input
	add     $40, %rcx           # Add 40 into total points

	cmp     $'y', %al           # Compare Y with user input
	jne     Five                # If false then jump to fifth question
	
	add     $40, %rbx           # If true then add 40 to rbx


Five:
	mov     $Fast, %rax
	call	PrintCString		# Fifth Question

	mov     $Fifth, %rax		# Buffer
	call	ScanChar            # User Input
	add     $20, %rcx           # Add 20 into total points

	cmp     $'y', %al           # Compare Y with user input
	jne     Calculate           # If false then jump to calculate

	add     $20, %rbx           # If true then add 20 to rbx


Calculate:

	mov     %rbx, %rax          # Store points earned into rax

	imul	$100, %rax          # Multiply points earned by 100 before division

	div     %rcx                # Divide (Points / Total) to get percentage

 	mov     %rax, %r11          # Store percentage into register 11

	mov     $Estimate, %rax
	call	PrintCString		# Print risk estimate

	mov     %r11, %rax          # Store percentage back into rax
	call	PrintInt            # Print percentage
	
	mov     $Percent, %rax
	call	PrintCString		# Print % sign

	call	EndProgram          # Complete program
	
