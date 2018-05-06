.DATA
16
256
1
2
3
4
5
6

// ".code x" or ".x" or ".code" are allowed.
// .data before or after .code is allowed.

.CODE
LDD R1, 2
STD R1, 1
LDD R3, 3
MOV R3, R4
SUB R3, R4
CALL R3
INC R0
INC R0
INC R0
INC R0
RET
INC R0
INC R0
INC R0
INC R0
RTI

.100
SETC
LDM R1,5
LDM R2,5
sub R1,R2
RTI


.120
LDM R1,5
LDM R2,5
sub R1,R2
RTI


