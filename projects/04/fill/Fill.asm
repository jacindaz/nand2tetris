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

  // try to store the value of RAM[24576] into
  // @keyboardValue (register 16)
  @KBD // register 24576
  D=M
  @keyboardValue // register 16
  M=D

  @SCREEN
  D=A
  @screenAddr
  M=D

  @CLEARSCREEN
  D;JEQ

  @FILLSCREEN // line 10
  // why can't you do M;JGT ???
  // syntax highlighting doesn't work for that
  D;JGT

  @LOOP
  0;JMP

(FILLSCREEN)
  // how do i find the max memory address ???
  // or do i just keep filling until i can't anymore ???
  // also, how do i know that i'm "done" filling
  // the screen ??? (until all registers have value 1???)

  @screenAddr
  A=M
  M=-1 // RAM[16384]=-1

  // jump when the currently selected register's value
  // is not zero !!!
  // if i don't specify a jump, will it fill in
  // black pixels forever ???
  // max address is: 24576
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
