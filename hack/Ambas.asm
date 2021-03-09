//l=80 square

@5	//5 registers wide
D=A
@0
M=D //store the lenght in RAM[0]

(LOOPTOP)

	@0
	D=M
	@pos
	M=D
	@SCREEN
	D=A
	@pos
	M=M+D
	
	@pos
	A=M
	M=-1
	
	@0
	D=M-1
	M=D
	
	@LOOPTOP
	D;JGE

@5
D=A
@0
M=D

(LOOPBOTTOM)

	@0
	D=M
	@pos
	M=D
	@SCREEN
	D=A
	@pos
	M=D+M
	@2624
	D=A
	@pos
	M=M+D
	
	@pos
	A=M
	M=-1
	
	@0
	D=M-1
	M=D
	
	@LOOPBOTTOM
	D;JGE

@80
D=A
@0
M=D

@SCREEN
    D=A
    @addr
    M=D

(LEFT)

	@32
	D=A
	@addr
	M=D+M   //addr=addr+32

    @addr
    A=M
    M=1   

	@0
	D=M-1
	M=D
	
	@LEFT
	D;JGE

@80
D=A
@0
M=D
@i
M=0

@SCREEN
    D=A
    @addr
    M=D

@6
D=A
@addr
M=M+D

(RIGHT)

    @32
    D=A
    @addr
    M=D+M   //addr=addr+32

    @addr
    A=M
    M=1    // RAM[addr]=1111111111111111

	@0
	D=M-1
	M=D

	@RIGHT
	D;JGE

/////////////////////////////////////////////////////////////
@5
D=A
@0
M=D

(TRIANGLEBOTTOM)

    @0
    D=M
    @pos
    M=D
    @SCREEN
    D=A
    @pos
    M=D+M
    @5504
    D=A
    @pos
    M=M+D

    @pos
    A=M
    M=-1

    @0
    D=M-1
    M=D

    @TRIANGLEBOTTOM
    D;JGE

@80
D=A
@0
M=D
@i
M=0

@SCREEN
    D=A
    @addr
    M=D

@addr
D=M
@2880
D=D+A
@addr
M=D

(TRIANGLELEFT)

    @32
    D=A
    @addr
    M=D+M   //addr=addr+32

    @addr
    A=M
    M=1

    @0
    D=M-1
    M=D

    @TRIANGLELEFT
    D;JGE

@5
D=A
@0
M=D

@i
M=0

@SCREEN
D=A
@addr
M=D

@2881
D=A
@addr
M=M+D

(HIPO)
	@i
	D=M
	@0
	D=D-M
	@END
	D;JGT
	
	@addr
	A=M
	M=1
	
	@448
	D=A+1
	@addr
	M=M+D
	
	@i
	M=M+1
	
	@HIPO
	0;JMP

(END)
	@END
	0;JMP
