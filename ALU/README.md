# ALU_GB: 8-bit Arithmetic Logic Unit for GameBoy

## Introduction

The **ALU_GB** is an 8-bit Arithmetic Logic Unit (ALU) designed for the GameBoy architecture. It performs a variety of arithmetic and logic operations essential for the functioning of the GameBoy's CPU. This ALU is implemented in VHDL and can be integrated into FPGA designs or used for educational purposes to understand how an ALU operates within a microprocessor.

## Features

- **Arithmetic Operations**: Addition, Subtraction, Decimal Adjust Accumulator (DAA)
- **Logical Operations**: AND, OR, XOR
- **Bitwise Operations**: Rotate Left (RL), Rotate Right (RR), Rotate Left through Carry (RLC), Rotate Right through Carry (RRC)
- **Shift Operations**: Shift Left Arithmetic (SLA), Shift Right Arithmetic (SRA), Shift Right Logical (SRL)
- **Data Manipulation**: SWAP (Swap upper and lower nibbles)
- **Flag Handling**: Updates Zero (Z), Subtract (N), Half Carry (H), and Carry (C) flags based on the operation result

## Architecture Overview

The ALU_GB is constructed using a structural VHDL design, where multiple component modules are instantiated and interconnected. Each component performs a specific operation, and the main ALU entity selects the appropriate operation based on the control signals.

### Component Modules

- **Arithmetic Units**: `add_GB`, `sub_GB`, `daa_GB`
- **Logical Units**: `and_GB`, `or_GB`, `xor_GB`
- **Shift and Rotate Units**: `srl_GB`, `sra_GB`, `sla_GB`, `rl_GB`, `rr_GB`, `rlc_GB`, `rrc_GB`
- **Data Manipulation**: `swap_GB`
- **Support Modules**: `RippleCarryFullAdder_GB`, `FullAdder_GB`, `add6`, `greaterthen`

### Interconnections

The main ALU entity (`ALU_GB`) receives inputs and passes them to the appropriate component based on the control signals. The output from the selected component is then forwarded as the ALU's output. Flags are updated accordingly in a separate process.

## Input and Output Ports

### Inputs

- **`in1`**: 8-bit data input A (`std_logic_vector(7 downto 0)`)
- **`in2`**: 8-bit data input B (`std_logic_vector(7 downto 0)`)
- **`control`**: 5-bit control signal to select the operation (`std_logic_vector(4 downto 0)`)
- **`inflags`**: 8-bit input flag register, containing flags like Carry (`C_FLAG`), Zero (`Z_FLAG`), etc. (`std_logic_vector(7 downto 0)`)

### Outputs

- **`out2`**: 8-bit result of the selected operation (`std_logic_vector(7 downto 0)`)
- **`outflags`**: 8-bit output flag register, updated based on the operation result (`std_logic_vector(7 downto 0)`)

## Control Signals and Operations

The ALU operation is selected using the `control` input. Each operation corresponds to a specific control code defined in the `globals` package.

### Supported Operations

| Control Code | Binary Value | Operation                     | Description                               |
|--------------|--------------|-------------------------------|-------------------------------------------|
| `ALU_ADD`    | `"00000"`    | Add                           | Adds `in1` and `in2`                      |
| `ALU_SUB`    | `"00001"`    | Subtract                      | Subtracts `in2` from `in1`                |
| `ALU_OR`     | `"00010"`    | Logical OR                    | Bitwise OR between `in1` and `in2`        |
| `ALU_XOR`    | `"00011"`    | Logical XOR                   | Bitwise XOR between `in1` and `in2`       |
| `ALU_AND`    | `"00100"`    | Logical AND                   | Bitwise AND between `in1` and `in2`       |
| `ALU_RR`     | `"00101"`    | Rotate Right                  | Rotates `in1` right by one bit            |
| `ALU_RL`     | `"00110"`    | Rotate Left                   | Rotates `in1` left by one bit             |
| `ALU_RRC`    | `"00111"`    | Rotate Right through Carry    | Rotates `in1` right through the Carry flag|
| `ALU_RLC`    | `"01000"`    | Rotate Left through Carry     | Rotates `in1` left through the Carry flag |
| `ALU_SLA`    | `"01001"`    | Shift Left Arithmetic         | Shifts `in1` left by one bit              |
| `ALU_SRA`    | `"01010"`    | Shift Right Arithmetic        | Shifts `in1` right by one bit (sign bit preserved) |
| `ALU_SRL`    | `"01011"`    | Shift Right Logical           | Shifts `in1` right by one bit (zero fill) |
| `ALU_SWAP`   | `"01100"`    | Swap Nibbles                  | Swaps the upper and lower nibbles of `in1`|
| `ALU_DAA`    | `"01101"`    | Decimal Adjust Accumulator    | Adjusts `in1` for BCD addition            |

**Note**: The control codes are defined in the `globals` package and must be consistent throughout your project.

## Flag Register (`outflags`)

The ALU updates the following flags based on the operation result:

- **Zero Flag (`Z_FLAG`)**: Set if the result is zero (bit position 7)
- **Subtract Flag (`N_FLAG`)**: Set if the operation was a subtraction (bit position 6)
- **Half Carry Flag (`H_FLAG`)**: Set if there was a carry from bit 3 to bit 4 (bit position 5)
- **Carry Flag (`C_FLAG`)**: Set if there was a carry out of the most significant bit (bit position 4)

## References

- **VHDL Documentation**: Refer to the VHDL language reference manual for syntax and usage.
- **GameBoy Architecture**: Understanding the GameBoy CPU architecture can provide insights into how this ALU fits into the larger system.

---

**Author**: Sergio Mercado Nunez (<SM9276@rit.edu>)  
**Date**: 10/13/2024  
**Project**: GameBoy-VHDL

---

