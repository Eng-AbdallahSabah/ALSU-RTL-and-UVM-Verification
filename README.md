# ALSU-with-UVM-Verification
A parameterized Arithmetic Logic Shift Unit (ALSU) in Verilog with multiple operations (AND/OR, add, multiply, shift/rotate) and bypass modes. Includes complete UVM verification environment with SystemVerilog, achieving full coverage through transaction-based testing and randomized stimulus.RetryClaude can make mistakes.
Arithmetic Logic Shift Unit (ALSU) with UVM Verification
A complete implementation of a parameterized ALSU module with comprehensive UVM-based verification environment.
Overview
This project implements a versatile Arithmetic Logic Shift Unit (ALSU) supporting multiple operations including logical operations, arithmetic calculations, and shift/rotate functionalities. The design features configurable parameters, bypass modes, and comprehensive error detection. The verification environment utilizes the Universal Verification Methodology (UVM) framework to ensure thorough testing and complete functional coverage.
ALSU Design Features

Multiple Operation Support:

AND operation (opcode 000) with optional reduction
OR operation (opcode 001) with optional reduction
Addition (opcode 010) with configurable full-adder mode
Multiplication (opcode 011)
Shift left/right (opcode 100)
Rotate left/right (opcode 101)


Flexible Configuration:

Parameterized input priority (A or B)
Configurable full adder mode
Bypass modes for direct input-to-output connections


Error Detection:

Invalid opcode detection
Invalid reduction operation detection
Visual indication via LED blinking


I/O Interface:

3-bit data inputs (A, B)
3-bit opcode for operation selection
Additional control signals (cin, serial_in, direction, etc.)
6-bit signed output
16-bit LED output for error indication



UVM Verification Environment
The project includes a complete UVM-based verification environment with:

Transaction Classes: Define stimulus and expected responses
Driver: Sends transactions to the DUT interface
Monitor: Observes DUT interface activity
Coverage Collector: Tracks functional and code coverage
Scoreboard: Verifies correct behavior against expected results
Environment: Integrates all verification components
Tests: Orchestrates test scenarios

Directory Structure
├── rtl/                      # RTL design files
│   └── ALSU.v                # ALSU module implementation
├── verification/             # UVM verification environment
│   ├── alsu_if.sv            # Interface definition
│   ├── alsu_pkg.sv           # Package containing UVM components
│   ├── config.sv             # Configuration class
│   ├── coverage.sv           # Coverage collection class
│   ├── driver.sv             # Driver class
│   ├── env.sv                # Environment class
│   ├── seq.sv                # Sequence and sequence item classes
│   └── test.sv               # Test class
├── testbench/                # Conventional testbench
│   └── alsu_tb.sv            # SystemVerilog testbench
├── sim/                      # Simulation files
│   └── run.do                # ModelSim simulation script
└── docs/                     # Documentation
    └── coverage_rpt.txt      # Coverage report
Verification Results
The ALSU design has been verified using:

Constrained random testing with UVM methodology
Directed tests for specific corner cases
Comprehensive coverage metrics:

100% statement coverage
100% branch coverage
100% toggle coverage
100% expression coverage



Simulation
To run the UVM simulation:

Ensure you have a SystemVerilog-capable simulator (e.g., Questasim, VCS)
Run the following commands:
cd sim
vsim -do run.do


Implementation
The design is suitable for FPGA implementation with the provided constraints file.

Acknowledgments

Based on industry-standard UVM verification methodology
Designed as a versatile arithmetic unit for digital systems
