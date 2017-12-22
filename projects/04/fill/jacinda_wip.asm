// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
  // this bit is to store @SCREEN's address into register 16
  @KBD
  D=A
  @keyboardAddr // register 16
  M=D

  // try to store the value of RAM[24576] into
  // @keyboardValue (register 17)
  @KBD // register 24576
  D=M
  @keyboardValue // register 17
  M=D

  @CLEARSCREEN
  D;JEQ

  // need to jump
  // if @keyboardValue is something other than 0
  @FILLSCREEN // line 10
  // why can't you do M;JGT ???
  // syntax highlighting doesn't work for that
  D;JGT

  @LOOP
  0;JMP

(FILLSCREEN)
  @SCREEN
  D=A
  @screenAddr
  M=D

  @screenAddr
  A=M
  M=-1

  @LOOP
  0;JMP

(CLEARSCREEN)
  // change this later to turn all pixels to 0
  @LOOP
  0;JMP