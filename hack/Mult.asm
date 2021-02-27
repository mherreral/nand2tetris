// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.
//mult = 0
//
//if(x<y):
//    for i in range(x):
//        mult=mult+y
//    print(mult)
//
//else:
//    for i in range(y):
//        mult=mult+x
//    print(mult)
@R2
M=0	//RAM[0]=0

@R0
D=M
@IF
D;JGT	//goto IF if R0>0

@END
0;JMP //if the previous did not jump, go to the end

(IF)
	@R1
	D=M
	@ASSIGN
	D;JGT // goto LOOP If R1>0
	
	@END
	0;JMP //if the previous did not jump, go to the end

(ASSIGN)
	@R0
	D=M
	@x
	M=D	//x=RAM[0]
	
	@R1
	D=M
	@y
	M=D	//y=RAM[1]
	
	@x
	D=M
	@y
	D=D-M
	@WHILEY
	D;JGT	// if(x>y) goto WHILEY
	
	@WHILEX
	0;JMP	// else goto WHILEX

(WHILEY)
	@x
	D=M
	@R2
	M=M+D
	
	@y
	M=M-1
	D=M
	@WHILEY
	D;JGT //while(y>0) M=M+x
	
	@END
	0;JMP

(WHILEX)
	@y
	D=M
	@R2
	M=M+D
	
	@x
	M=M-1
	D=M
	@WHILEX
	D;JGT	//while(x>0)
	
	@END
	0;JMP

(END)
@END
0;JMP
