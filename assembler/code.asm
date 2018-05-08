.DATA
4               ;the program starts at address 4
100             ;ISR address

.CODE
LDM R1,7        ;R1=7
LDM R2,6        ;R2=6
LDM R0,10       ;R0=10
LDM R4,5        ;R4=5
Add R2,R1       ;R1=13  N=0  C=0  Z=0
OR  R0,R2       ;R2=14  N=0  C=0  Z=0
Sub R0,R4       ;R4=-5  N=1  
Mov R1,R3       ;R3=13 
AND R2,R1       ;R1=12
SHL R1,2,R0     ;R0=48
MUL R2,R1       ;R1=168  R2=0 [semester only]

;set value 005D at In Port
IN R0           ;R0=5
SETC            ;C=1

;set value 004D at In Port
IN R1           ;R1=4

;set value 007D at In Port
IN R3           ;R3=7
RLC R0          ;R0=11   C=0
NOT R1          ;R1=-5=1111111111111011b   N=1 Z=0
RRC R3          ;R3=3    C=1
CLRC    
INC R0          ;R0=12
DEC R1          ;R1=-6 N=1 Z=0

; out
OUT r1

.100
SETC
LDM R1,5
LDM R3,5
NOP
NOP
Sub R3,R1       ;R1=0 Z=1
RTI