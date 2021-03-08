//l=80 square

//@5	//5 registers wide
//D=A
//@0
//M=D //store the lenght in RAM[0]
//
//(LOOPTOP)
//
//	@0
//	D=M
//	@pos
//	M=D
//	@SCREEN
//	D=A
//	@pos
//	M=M+D
//	
//	@pos
//	A=M
//	M=-1
//	
//	@0
//	D=M-1
//	M=D
//	
//	@LOOPTOP
//	D;JGE

//@5
//D=A
//@0
//M=D
//
//(LOOPBOTTOM)
//
//	@0
//	D=M
//	@pos
//	M=D
//	@SCREEN
//	D=A
//	@pos
//	M=D+M
//	@2624
//	D=A
//	@pos
//	M=M+D
//	
//	@pos
//	A=M
//	M=-1
//	
//	@0
//	D=M-1
//	M=D
//	
//	@LOOPBOTTOM
//	D;JGE
//
//@80
//D=A
//@0
//M=D
//@i
//M=0
//
//@SCREEN
//    D=A
//    @addr
//    M=D
//
//(LEFT)
//
//    @i
//    D=M
//    @0
//    D=D-M
//    @END
//    D;JGT   // if i>n goto END
//
//	@32
//	D=A
//	@addr
//	M=D+M   //addr=addr+32
//
//    @addr
//    A=M
//    M=1    // RAM[addr]=1111111111111111
//
//    @i
//    M=M+1   // i++
//
//    @LEFT
//    0;JMP   //goto LOOP

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

    @i
    D=M
    @0
    D=D-M
    @END
    D;JGT   // if i>n goto END

    @32
    D=A
    @addr
    M=D+M   //addr=addr+32

    @addr
    A=M
    M=1    // RAM[addr]=1111111111111111

    @i
    M=M+1   // i++

    @RIGHT
    0;JMP   //goto LOOP

//@SCREEN
//D=A
//@addr
//M=D
//
//@31
//D=A
//@addr
//D=D+M
//M=D
//
//@addr
//A=M
//M=1



	@END
	0;JMP



(END)
	@END
	0;JMP
