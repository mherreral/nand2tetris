// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
//infinite loop which is always listening to the keyboard
	@KBD
	D=M
	
	@BLACK		
	D;JGT		//jump to black if RAM[KBD] > 0
	
	@WHITE
	0;JMP		//jump to white if RAM[KBD] == 0

(BLACK)

	@0
	M=-1
	@FILL
	0;JMP		//set RAM[0] to -1 (1111111111111111) and fill

(WHITE)

	@0
	M=0
	@FILL
	0;JMP		//set RAM[0] to 0 and fill

(FILL)

	@5
    D=A
    @1
    M=D		//set RAM[1] to our counter which is 8192 (256*32), this is the quantity of pixels

   // @SCREEN
   // D=A
   // @addr
   // M=D //addr=16384
   //     //(screen's base address)

   // @80
   // D=A
   // @n
   // M=D

   // @i
   // M=0 //i=0

	(TOPHORI)

		@1
		D=M
		@pos
		M=D
		@SCREEN
		D=A
		@pos
		M=M+D 	//create a variable to store my current position based on the screen pos and the quantity of bits
		
		@0
		D=M
		@pos
		A=M
		M=D			//draw the pixel with RAM[0] content
		
		@1
		D=M-1
		M=D			//decrement our counter
		
		@1
		D=M
		@TOPHORI
		D;JGE		//while the counter is greater or equal to 0, fill

//	(BOTTOMHORY)
//	
//		@5
//		D=A
//		@1
//		M=D
//		
//		@1		// RAM[1]=5 (5 REGISTERS)
//		D=M		
//		@pos
//		M=D
//		@SCREEN
//		D=A
//		@pos
//		M=M+D
//		@2560
//		D=A
//		@pos
//		M=M+D
//
//        @0
//        D=M
//        @pos
//        A=M
//        M=D         //draw the pixel with RAM[0] content
//
//        @1
//        D=M-1
//        M=D         //decrement our counter
//
//        @1
//        D=M
//        @BOTTOMHORI
//        D;JGE       //while the counter is greater or equal to 0, fill
//	(LEFTVER)
//	
//	  
//	    D=M
//	    @n
//	    D=D-M
//	    @END
//	    D;JGT   // if i>n goto END
//
//		@0
//		D=M
//		
//	    @addr
//	    A=M
//	    M=D // RAM[addr]=1111111111111111
//	
//	    @i
//	    M=M+1   // i++
//	
//	    @32
//	    D=A
//	    @addr
//	    M=D+M   //addr=addr+32
//	
//	    @LEFTVER
//	    0;JMP   //goto LOOP


	@LOOP
	0;JMP			//infinite loop
