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
	
	@SQUARE
	D;JGE

(END)
@END
0;JMP
