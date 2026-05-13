# ECE4300_InstructionDecode

<img width="1551" height="598" alt="image" src="https://github.com/user-attachments/assets/13c6e218-e3eb-454b-9aaf-a2536b5c49dd" />


Decode Stage (ID) Testbench

This testbench verifies the functionality of the Instruction Decode (ID) stage and its individual modules within the MIPS pipeline.

Control Unit (control.v)
Decodes the instruction opcode and generates the execute, memory, and writeback control signals used by later pipeline stages.
Register File (regfile.v)
Reads data from the source registers specified in the instruction and allows data to be written back into registers during writeback operations.
Sign Extension (sign_ext.v)
Extends the 16-bit immediate field of the instruction into a 32-bit value for arithmetic and memory operations.
ID/EX Latch (idExLatch.v)
Stores decoded instruction data, register values, immediate values, and control signals before passing them into the Execute Stage on the next clock cycle.
Top ID Module (top_id.v)
Connects all Decode Stage modules together and controls the overall operation of the stage.

The waveform output confirms that the control signals, register values, immediate values, and instruction fields update correctly during simulation for multiple instruction types. The testbench was used to verify correct functionality of the complete Decode Stage and its individual modules.
