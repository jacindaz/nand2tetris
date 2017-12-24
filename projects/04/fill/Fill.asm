// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
  // reset values in register 16
  @16
  M=0
  @17
  M=0
  @18
  M=0

  // try to store the value of RAM[24576] into
  // @keyboardValue (register 16)
  @KBD // register 24576
  D=M
  @keyboardValue // register 16
  M=D

  @CLEARSCREEN
  D;JEQ

  // store the keyboard base address
  // to increment later when iterating
  @SCREEN
  D=A
  @screenAddr
  M=D

  @FILLSCREEN
  D;JGT

  @LOOP
  0;JMP

(FILLSCREEN)
  @screenAddr
  A=M
  M=-1 // RAM[16384]=-1

  @KBD // get the keyboard base address, save into D
  D=A
  @keyboardMax
  M=D // D is keyboard base address
  @screenAddr
  D=M
  @keyboardMax // @keyboardMax is 24576
  M=D-M
  D=M

  @LOOP
  D;JGE

  @32
  D=A
  @screenAddr
  M=M+D

  @FILLSCREEN
  0;JMP

(CLEARSCREEN)
  @SCREEN
  D=A
  @screenAddr
  M=D

  @screenAddr
  A=M
  M=0

  @LOOP
  0;JMP
