// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.
//
// Tips for keyboard listener homework problem:
// * use a loop with pointers to continuously listen for any keyboard input
// * need to fill every pixel (all memory addresses) with black or white

(LOOP)
  // this bit is to store @SCREEN's address into register 16
  @KBD
  D=A
  @addr
  M=D

  // try to store the value of RAM[24576] into
  // @keyboardValue (register 17)
  @KBD
  D=M
  @keyboardValue
  M=D

  @LOOP
  0;JMP
