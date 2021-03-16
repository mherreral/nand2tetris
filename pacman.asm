// WHICH REGISTER
@0
D=A
@i
M=D

// RIGHT AND LEFT KEYSCAN
@130
D=A
@LEFT
M=D

@132
D=A
@RIGHT
M=D

// SCREEN ADDRESS 16384
// SET DEFAULT SCREEN VALUE

//1
@16416
D=A
@A
M=D

//2
@16448
D=A
@B
M=D

//3
@16480
D=A
@C
M=D

//4
@16512
D=A
@D
M=D

//5
@16544
D=A
@E
M=D

//6
@16576
D=A
@F
M=D

//7
@16608
D=A
@G
M=D

//8
@16640
D=A
@H
M=D

//9
@16672
D=A
@I
M=D

//10
@16704
D=A
@J
M=D

//11
@16736
D=A
@K
M=D

//12
@16768
D=A
@L
M=D

//13
@16800
D=M
@M
M=D

@OPEN
0;JMP

// SCREEN ADDRESS 16384

(KBDCHECK)

    @KBD
    D=M

	@RIGHT
	D=D-M
	@MOVE_RIGHT
	D;JEQ
	
	@KBD
	D=M

	@LEFT
	D=D-M
	@MOVE_LEFT
	D;JEQ

	@KBD
	D=M

    @CLOSED
    D;JGT	//CLOSE MOUTH
    @OPEN
    D;JEQ	//OPEN MOUTH

    @KBDCHECK
    0;JMP

(OPEN)

	//1
	@i
	D=M
	@A
	D=M+D
	@AUX
	M=D
	@992
	D=A
	@AUX
	A=M
	M=D


    //2
	@i
	D=M
	@B
	D=M+D
	@AUX
	M=D
    @4088
    D = A
    @AUX
	A=M
    M = D

    //3
	@i
	D=M
	@C
	D=M+D
	@AUX
	M=D
    @8188
    D = A
    @AUX
	A=M
    M = D

    //4
	@i
	D=M
	@D
	D=M+D
	@AUX
	M=D
    @8188
    D = A
    @AUX
	A=M
    M = D

    // 5
	@i
	D=M
	@E
	D=M+D
	@AUX
	M=D
    @16352
    D = A
    @AUX
	A=M
    M = D

    //6
	@i
	D=M
	@F
	D=M+D
	@AUX
	M=D
    @16256
    D = A
    @AUX
	A=M
    M = D

    //7
	@i
	D=M
	@G
	D=M+D
	@AUX
	M=D
    @15360
    D = A
    @AUX
	A=M
    M = D

    //8
	@i
	D=M
	@H
	D=M+D
	@AUX
	M=D
    @16256
    D = A
    @AUX
	A=M
    M = D

    //9
	@i
	D=M
	@I
	D=M+D
	@AUX
	M=D
    @16352
    D = A
    @AUX
	A=M
    M = D

    //10
	@i
	D=M
	@J
	D=M+D
	@AUX
	M=D
    @8188
    D = A
    @AUX
	A=M
    M = D

    //11
	@i
	D=M
	@K
	D=M+D
	@AUX
	M=D
    @8188
    D = A
    @AUX
	A=M
    M = D

    //12
	@i
	D=M
	@L
	D=M+D
	@AUX
	M=D
    @4088
    D = A
    @AUX
	A=M
    M = D

    //13
	@i
	D=M
	@M
	D=M+D
	@AUX
	M=D
    @992
    D = A
    @AUX
	A=M
    M = D

    //14
    @KBDCHECK
    0;JMP

(CLOSED)

    // 5
    @i
	D=M
    @E
	D=D+M
	@AUX
	M=D
	@16382
	D=A
	@AUX
	A=M
    M = D

    //6
	@i
	D=M
    @F
	D=D+M
	@AUX
	M=D
    @16382
	D=A
	@AUX
	A=M
    M = D

    //7
	@i
	D=M
    @G
	D=D+M
	@AUX
	M=D
    @16382
	D=A
	@AUX
	A=M
    M = D

    //8
	@i
	D=M
    @H
	D=D+M
	@AUX
	M=D
    @16382
	D=A
	@AUX
	A=M
    M = D

    //9
	@i
	D=M
    @I
	D=D+M
	@AUX
	M=D
    @16382
	D=A
	@AUX
	A=M
    M = D

    @KBDCHECK
    0;JMP

(MOVE_RIGHT)
	@8191
    D=A
    @1
    M=D

    (NEXT)

        @1
        D=M
        @pos
        M=D
        @SCREEN
        D=A
        @pos
        M=M+D   //create a variable to store my current position based on the screen pos and the quantity of bits

		@0	
        D=A
        @pos
        A=M
        M=D         //draw the pixel with RAM[0] content

        @1
        D=M-1
        M=D         //decrement our counter

        @1
        D=M
        @NEXT
        D;JGE

	@i
	M=M+1 //i++
	
	@OPEN
	0;JMP

(MOVE_LEFT)
	@8191
    D=A
    @1
    M=D
	
	    (PROX)
	
	        @1
	        D=M
	        @pos
	        M=D
	        @SCREEN
	        D=A
	        @pos
	        M=M+D   //create a variable to store my current position based on the screen pos and the quantity of bits
	
	        @0
	        D=A
	        @pos
	        A=M
	        M=D         //draw the pixel with RAM[0] content
	
	        @1
	        D=M-1
	        M=D         //decrement our counter
	
	        @1
	        D=M
	        @PROX
	        D;JGE
	
	@i
	M=M-1
	
	@OPEN
	0;JMP
