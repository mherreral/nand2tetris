//flips the values of RAM[0] and RAM[1]
		@R1 // A=RAM[1]
		D=M // register D = RAM[1]
		@temp
		M=D // temp = D remember that we already store the value in the D register
		
		@R0 // A=RAM[0]
		D=M // D register = RAM[0]
		@R1
		M=D	// R1=R0
		
		@temp
		D=M // D equals to what is loaded in temp
		@R0
		M=D // R0=temp

	(END)
		@END
		0; JMP
