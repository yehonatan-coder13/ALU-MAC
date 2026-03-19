# ALU-MAC: High-Performance 3-Operand ALU

## Project Overview
This project features a specialized **Arithmetic Logic Unit (ALU)** designed in **SystemVerilog**. Unlike standard ALUs, this design is optimized for **Multiply-Accumulate (MAC)** operations, which are the fundamental building blocks for **AI Hardware Accelerators** and Convolutional Neural Networks (CNNs).

The unit is engineered for high-frequency clocking and efficient data-path routing, making it suitable for DSP applications and hardware-level signal processing.

## Key Features
* **3-Operand Architecture**: Supports operations involving three simultaneous inputs $(A \times B + C)$.
* **Convolution Optimized**: Specialized logic for fast multiply-add cycles used in convolution kernels.
* **Synchronous Design**: Fully synchronous with active-low reset and optimized flip-flop placement for timing closure.
* **Verification Suite**: Includes a comprehensive SystemVerilog Testbench for functional coverage and edge-case testing.

## Technical Specifications
| Feature | Description |
| :--- | :--- |
| **Language** | SystemVerilog (IEEE 1800) |
| **Data Width** | 32-bit (Parametric) |
| **Supported Ops** | ADD, SUB, MUL, MAC, AND, OR, XOR |
| **Target Apps** | AI Accelerators, DSP Units, Image Processing |

## Interface Signals
* `clk`: System Clock
* `rst_n`: Asynchronous Active-Low Reset
* `opcode`: Operation Selector
* `op_a`, `op_b`, `op_c`: Input Operands
* `alu_out`: Result Output
* `overflow`: Status Flag

## How to Run Simulation
The project is compatible with major simulators (Questasim, Vivado, Icarus Verilog). To run the testbench using a standard Makefile:
```bash
make sim
