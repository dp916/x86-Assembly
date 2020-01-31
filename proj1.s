# proj1.s
# Danny Pham

# Project 1 - Guess My Phrase

# Assemble	as -o proj1.o proj1.s
# Link 		ld -o a.out proj1.o csc35.o
# Execute	a.out

 
.data

Player1:
	.ascii "\n\nLet's see if you and your friend think alike!\n\nPlayer 1: Pick a word: \0"

Scan:
	.space 35

Twin:
	.space 35

Player2:
	.ascii "Player 2: The word is \0"

Attempt:
	.ascii "\nYour Guess: \0"	

Entry:
	.space 35

False:
	.ascii "Sorry, that is wrong\n\n\0"

True:
	.ascii "Correct!\n\0"

Sensei:
	.ascii "\nA - You are the Master Sensei!\n\n\0"

Prodigy:
	.ascii "\nB - You are the Prodigy!\n\n\0"

Process:
	.ascii "\nC - Keep working your time will come.\n\n\0"


.text
.global _start


_start:
                            # Display program's name
	mov     $Player1, %rax
	call	PrintCString
                            # Read the correct answer from the keyboard
	mov     $35, %rbx
	mov     $Scan, %rax
	call	ScanCString
                            # Store length of correct answer
	call	LengthCString
	mov     %rax, %rdx

                            # For loop to make a copy of the correct answer
	mov     $0, %rdi
Fore:
	cmp     $35, %rdi
	je      Counter

	mov     Scan(%rdi), %al	# Copying into Scan & Twin buffers
	mov     %al, Twin(%rdi)	# Scan[%rdi] = Twin[%rdi]
	add     $1, %rdi
	jmp     Fore

                            # Start with new counter
Counter:
	mov     $0, %r13

	mov     $1, %rcx
                            # For loop to replace every second character with underscore
Four:
	cmp     %rdx, %rcx
	jge     Clear

	movb	$95, Scan(%rcx)	# Moving _ into every 2nd character of Scan buffer
	add     $2, %rcx
	jmp     Four

                            # Clear screan
Clear:
	call	VTClearScreen	

                            # Do loop
Do:                         # Display for player 2
	mov     $Player2, %rax
	call	PrintCString
	
	mov     $Scan, %rax
	call	PrintCString
				
	mov     $Attempt, %rax
	call	PrintCString
                            # Store player 2 entry into buffer
	mov     $Entry, %rax
	mov     $35, %rbx
	call	ScanCString

                            # For loop to compare the correct answer to the guess
	mov     $0, %r11
For:
	cmp     %rdx, %r11
	jg      Correct

	mov     Twin(%r11), %al # Moving answer & player 2 input into seperate register for cmp loop
	mov     Entry(%r11), %bl

	cmp     %al, %bl

	jne     Wrong

	add     $1, %r11
	jmp     For

                            # If False
Wrong:
	mov     $False, %rax
	call	PrintCString
	add     $1, %r13        # Counter for grade
	
	jmp     Do
                            # If True
Correct:
	mov     $True, %rax
	call	PrintCString

	jmp     Grade           # Exit the do while loop

                            # Extra credit that determines Player 2 performance
Grade:
	cmp     $1, %r13
	jg      Tier2
                            # 1-2 attempts Master Sensei status
	mov     $Sensei, %rax
	call	PrintCString
	
	jmp     End

Tier2:
	cmp     $3, %r13
	jg      Tier3
                            # 3-4 attempts Prodigy status
	mov     $Prodigy, %rax
	call	PrintCString

	jmp     End

Tier3:                      # 5+ attempts Processing status
	mov     $Process, %rax
	call	PrintCString
	
	jmp     End

                            # Complete program
End:
	call	EndProgram

