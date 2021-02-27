// Computes RAM[1] = 1+2+ ... +n
// Usage: put a number (n) in RAM[0]
	@R0
	D=M
	@n
	M=D	// n=r0
	
	@i
	M=1	// i=1
	
	@sum
	M=0	//sum = 0

(LOOP)
	@i
	D=M
	@n
	D=D-M
	@STOP
	D;JGT // if i>n goto STOP
	
	@sum
	D=M
	@i
	D=D+M
	@sum
	M=D	// sum = sum + i
	
	@i
	M=M+1	// i = i+1
	
	@LOOP
	0;JMP	//goto LOOP

(STOP)
	@sum
	D=M
	@R1
	M=D	// RAM[1]=SUM

(END)
	@END
	0;JMP
