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

LDD R0, 10
MOV R0, R1
LDD R2, 11
STD R2, 0
LDD R3, 12
OUT R3
IN R4
SETC

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