  0:     LD  6,0(0) Place content of the address = 0 + r0 in r6
  1:     ST  0,0(0) Place the content of r0 in address 0 + r0
  2:     IN  0,0,0  Read an put in register r0. 
  Just line 3 un TINY language
  3:     ST  0,0(5) Place the content of r0 in address = 0 + r5 
  Input saved in memory address 0 + r5
  4:    LDC  0,0(0) Place 0 in r0.
  Now r0 have 0
  5:     ST  0,0(6) Place the content of r0 in adress 0 + r6.
  0 saved in memory address 0 + r6
  6:     LD  0,0(5) Place content of address = 0 + r5 in r0.
  r0 = input
  7:     LD  1,0(6) Place content of address = 0 + r6 in r1.
  r1 = 0
  8:    SUB  0,1,0  r0 = r1 - r0
  r0 = 0 - input
  9:    JLT  0,2(7) if r9 < 0 then jump to 2 + r7
  -input < 0
 10:    LDC  0,0(0) 
 11:    LDA  7,1(7) 
 12:    LDC  0,1(0) 
 14:    LDC  0,1(0) 
 15:     ST  0,1(5) 
 16:     LD  0,1(5) 
 17:     ST  0,0(6) 
 18:     LD  0,0(5) 
 19:     LD  1,0(6) 
 20:    MUL  0,1,0 
 21:     ST  0,1(5) 
 22:     LD  0,0(5) 
 23:     ST  0,0(6) 
 24:    LDC  0,1(0) 
 25:     LD  1,0(6) 
 26:    SUB  0,1,0 
 27:     ST  0,0(5) 
 28:     LD  0,0(5) 
 29:     ST  0,0(6) 
 30:    LDC  0,0(0) 
 31:     LD  1,0(6) 
 32:    SUB  0,1,0 
 33:    JEQ  0,2(7) 
 34:    LDC  0,0(0) 
 35:    LDA  7,1(7) 
 36:    LDC  0,1(0) 
 37:    JEQ  0,-22(7) 
 38:     LD  0,1(5) 
 39:    OUT  0,0,0 
 13:    JEQ  0,27(7) 
 40:    LDA  7,0(7) 
 41:   HALT  0,0,0 
