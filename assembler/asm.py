import sys
import argparse

NUMBER_OF_BITS = 16


class Assembler(object):
    ZERO_OPERAND_INST = 0
    ONE_OPERAND_INST = 1
    TWO_OPERAND_INST = 2
    THREE_OPERAND_INST = 3

    def __init__(self, path, code_output_path, data_output_path):
        self.path = path
        self.code_output_path = code_output_path
        self.data_output_path = data_output_path

        self.registers = {'r0': '000', 'r1': '001', 'r2': '010', 'r3': '011', 'r4': '100', 'r5': '101',
                          'r6': '110', 'r7': '111'}

        self.file_lines = []
        self.code_seg_start_line = 0

        self.current_code_mem_location = 0

        self.variables = {}

        self.binary_code = []
        self.instructions = self.__read_dict("instructions_dictionary.txt", ' ')

    def parse(self):
        self.__read_code_file()
        self.__parse_data_seg()
        self.__scan_code()
        self.__save_instructions()
        self.__save_data()

    # Get the instruction information (Type, number of operands, size in RAM file, etc)
    def __get_instruction_info(self, line):
        # Return instruction info and operands count
        words = line.split(" ", 1)
        # Remove all spaces.
        words[0] = words[0].replace(" ", "")
        if len(words) > 1: words[1] = words[1].replace(" ", "")

        ir = ''
        category = -1
        size = 1
        ir = self.instructions[words[0]]

        if len(words) == 1:  # No operand instructions.
            category = Assembler.ZERO_OPERAND_INST

            if len(self.instructions[words[0]]) == 10:  # MOV, IN or OUT instructions.
                if words[0] == 'mov':
                    source, destination = words[1].split(",")
                    ir += self.registers[destination] + self.registers[source]
                elif words[0] == 'in':
                    destination = words[1]
                    ir += self.registers[destination] + "000"
                else:
                    source = words[1]
                    ir += "000" + self.registers[source]

        elif len(words[1].split(",")) < 3:

            if len(words[1].split(",")) == 1:  # One operand instructions.
                category = Assembler.ONE_OPERAND_INST

                if words[0][0] == "j":  # Branch instructions
                    src = words[1]
                    ir += "000" + self.registers[src]

                elif len(self.instructions[words[0]]) == 13:  # CALL, PUSH or POP instructions.
                    register = words[1]
                    ir += self.registers[register]

                else:  # One operand ALU instructions
                    register = words[1]
                    ir += self.registers[register] + self.registers[register]

            else:  # Two operand instructions.
                category = Assembler.TWO_OPERAND_INST

                if words[0] == "ldm":  # LDM instruction.
                    destination, immediate_value = words[1].split(",")
                    immediate_value = int(immediate_value)
                    ir += self.registers[destination] + "000"
                    ir += "," + ('0' * (NUMBER_OF_BITS - len(bin(immediate_value)[2:]))) + bin(immediate_value)[2:]

                elif words[0] == "ldd" or words[0] == "std":
                    register, effective_address = words[1].split(",")
                    effective_address = int(effective_address)
                    ir += ('0' * (10 - len(bin(effective_address)[2:]))) + bin(effective_address)[2:] + self.registers[
                        register]

                else:  # Two operand ALU instructions.
                    source, destination = words[1].split(",")
                    ir += self.registers[destination] + self.registers[source]

        else:  # Three operand instructions.
            category = Assembler.THREE_OPERAND_INST
            size = 2
            source, immediate_value, destination = words[1].split(",")
            immediate_value = int(immediate_value)
            # Ignore instructions if the immediate shift value is zero
            if immediate_value <= 0:
                size = 0

            # Limit immediate value to max 16
            immediate_value = min(15, immediate_value - 1)

            ir += ('0' * (4 - len(bin(immediate_value)[2:]))) + bin(immediate_value)[2:] + \
                  self.registers[destination] + self.registers[source]

        return ir, category, size

    def __read_code_file(self):
        # Read the file info string
        with open(self.path) as fp:
            line = fp.readline()
            while line:
                if len(line.strip()) != 0 and line.strip()[0] != ";" and line.strip()[0] != "#" and line.strip()[:2] != "//":
                    self.file_lines.append(line.strip().lower())
                line = fp.readline()

    # Get the data variables.
    def __parse_data_seg(self):
        data_seg = False

        for line in self.file_lines:

            if line == ".data":
                data_seg = True
                continue
            if not data_seg:
                continue

            address, value = line.split(" ", 1)
            value = value.replace(" ", "")
            value = int(value)
            address = int(address)
            self.variables[address] = ('0' * (NUMBER_OF_BITS - len(bin(value)[2:]))) + bin(value)[2:]

    # Scan the code to get instructions.
    def __scan_code(self):
        # Scan to get variables/labels
        for i in range(self.code_seg_start_line + 1, len(self.file_lines)):

            line = self.file_lines[i]
            if line == '.data':
                break

            ir, category, size = self.__get_instruction_info(line)

            if size > 0:
                self.binary_code.append(ir)

            self.current_code_mem_location += size

    def __save_instructions(self):
        with open(self.code_output_path, "w") as f:
            f.write("// memory data file (do not edit the following line - required for mem load use)" + '\n')
            f.write("// instance=/processor/PROG_MEM/Mem" + '\n')
            f.write("// format=mti addressradix=d dataradix=b version=1.0 wordsperline=1" + '\n')

            size = 0
            for ir_code in self.binary_code:
                if ir_code != '':
                    for code in ir_code.split(','):
                        f.write(" " * (3 - len(str(size))) + str(size) + ": " + str(code) + '\n')
                        size += 1

    def __save_data(self):
        with open(self.data_output_path, "w") as f:
            f.write("// memory data file (do not edit the following line - required for mem load use)" + '\n')
            f.write("// instance=/processor/DATA_MEM/Mem" + '\n')
            f.write("// format=mti addressradix=d dataradix=b version=1.0 wordsperline=1" + '\n')

            size = 0
            while size < 512:
                if size in self.variables.keys():
                    f.write(" " * (3 - len(str(size))) + str(size) + ": " + self.variables[size] + '\n')
                else:
                    f.write(" " * (3 - len(str(size))) + str(size) + ": " + ('0' * NUMBER_OF_BITS) + '\n')
                size += 1

    # Read instructions dictionary.
    @staticmethod
    def __read_dict(filename, sep):
        with open(filename, "r") as f:
            dict_ret = {}
            values = []
            for line in f:
                if len(line.strip()) != 0 and line.strip()[0] != "#" and line.strip()[:2] != "//":
                    line = line.rstrip()
                    line = line.lower()
                    values.append(line.split(sep))
            for value in values:
                dict_ret[value[0]] = value[1]
        return dict_ret


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', type=str, help='The assembly code input file.')
    args, unparsed = parser.parse_known_args()
    code_file_path = 'code.asm'
    code_ram_file_path = 'CODE_RAM.mem'
    data_ram_file_path = 'DATA_RAM.mem'
    if args.i is not None: code_file_path = args.i
    a = Assembler(code_file_path, code_ram_file_path, data_ram_file_path)
    a.parse()
