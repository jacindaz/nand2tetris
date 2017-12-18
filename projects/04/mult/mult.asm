// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Need to intialize R2 to 0
@R0
D=M
@R2ZERO
D;JEQ

@R1
D=M
@R2ZERO
D;JEQ

@i
M=0
(LOOP)
  // grab the value that's in register 0 (@RO)
  // looks like @i is initialized as 0
  @i
  D=M
  @R0
  D=D-M

  // if (i==n) goto END
  @END
  D;JEQ // should this be less than or equal ???

  @R1
  D=M

  @R2 // now register M is register 2
  // set register 2
  // to whatever was already stored in R2 + D (which is R1)
  M=M+D

  // i++
  @i
  M=M+1
  @LOOP
  0;JMP

(R2ZERO)
  @R2
  M=0

  @END
  0;JMP

(END)
  @END
  0;JMP
