// if c key is pressed, draw a square
// if t key is pressed, draw a triangle
@triangle
M=107

@square
M=99

(LOOP)
	@KBD
	D=M
	
	@triangle
	D=D-M
	@TRIANGLE
	D;JEQ
	
	@KBD
	D=M
	
	@square
	D=D-M
	@SQUARE
	D;JEQ

	@LOOP
	0;JMP

(SQUARE)
@5
D=A
@1
M=D

(TOP)
@1
D=M
@pos
M=D
@SCREEN
D=A
@pos
M=M+D

@pos
M=-1

@1
D=M-1
M=D

