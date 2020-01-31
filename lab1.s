# lab1.s
# Danny Pham
#
# 1. Assemble	: as -o lab1.o lab1.s
# 2. Link       : ld -o a.out lab1.o csc35.o
# 3. Execute	: a.out

.data                               #Start the data section
Message:                            #Message is an address
	.ascii "Hello Dr. Sugar!\n\0"	#Create a buffer of ASCII
Name:
	.ascii "My name is Danny Pham.\n\0"
Month:
	.ascii "I haven't had a check-up in \0"
Checkup:
	.ascii " months\n\0"	
Quote: 
	.ascii "Atlanta Falcons blew a 25 point lead in the super bowl.\0"

	
.text                       #Start the text section
.global _start				#Make the _start label public

_start:                     #UNIX starts here
	mov $Message, %rax		#Put the address into ra
	call PrintCString		#Execute the csc35.o subroutine

	mov $Name, %rax			#Put the address into ra
	call PrintCString		#Execute the csc35.o subroutine
	
	mov $Month, %rax
	call PrintCString

	mov $2, %rax
	call PrintInt

	mov $Checkup, %rax
	call PrintCString

	mov $Quote, %rax
	call PrintCString

	call EndProgram			#Execute the csc35.o subroutine
	
