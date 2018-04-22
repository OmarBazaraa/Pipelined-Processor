.CODE
LDD R1, 10
MOV R1, R2
INC R2

#
# M[1] = R1 = Fib(4)
#
#LDD R0, 10
#LDM R5, 7
#LDM R6, 12
#LDM R1, 1
#MOV R0, R2
#MUL R2, R1
#DEC R0
#JZ R6
#JMP R5
#STD R1, 1

.DATA
// Address Data (decimal)
10 4