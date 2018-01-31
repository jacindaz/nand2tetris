
@SCREEN
D=A
@addr
M=D // addr = 16384, screen's base address

@0
D=M
@n
M=D // n=RAM[0]

@i
M=0 // i=0

(LOOP)
  @i
  D=M
  @n
  D=D-M

  @END
  D;JGT // if i>n goto END

  @addr // register 0 or 16 ???
  A=M
  M=-1 // RAM[addr]=111111, sets the pixels to black

  @i
  M=M+1 // i=i+1
  @32 // select RAM[32] to get its address
  D=A // D=RAM[32]
  @addr
  // then add RAM[32] to the screen base address
  // (stored in @addr)
  M=M+D // addr=addr(M)+32(D)

  @LOOP
  0;JMP // goto LOOP

(END)
  @END // program's end
  0;JMP // infinite loop
