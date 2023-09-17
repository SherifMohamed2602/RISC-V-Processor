# RISC-V-Processor
A single-Cycled Processor with RISC-V architecture 

This 32-bit single cycle RISC-V processor is designed following RISC-V architecture with its standard ISA using Verilog HDL and according to the general principles described in the book "Digital Design and Computer Architecture" by David Harris and Sarah Harris.

Every instruction is totally fetched, decoded and executed in a single clock cycle. 

- This design supports 31 instruction which are classified into 6 instruction formats:
  
![FORMATS](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/571c0182-8d0b-43d5-8a74-48650c84cbed)

- The supported R-Type instructions and their OPCode:
  
![Inst_R1](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/10803da9-26d0-4667-bfef-beb38e85da16)
![Inst_R2](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/04b6982e-3d0f-4192-b694-db844f2a68c9)

- The supported Arithmetic I-Type instructions and their OPCode:

![I2](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/42f7daa6-8609-40d1-a236-6d851c4254dc)
![I3](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/83ce8e70-01bb-4c87-b0f1-aa3f6401a5ac)
![inst_I1](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/1c8948a3-056f-4960-911d-0785467cb0f5)

- The supported Load I-Type instructions and their OPCode:
 
![load](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/bd632e5a-8003-4905-a77e-8fd43cf7c049)

- The supported S-Type instructions and their OPCode:
  
![store](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/4cf965b6-6a54-462c-9b07-24f029211594)

- The supported Load SB-Type instructions and their OPCode:

![SB](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/86fe320c-335d-408d-8b59-ba0c3651f26d)

-The supported Load U-Type instructions and their OPCode:

![U-F](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/f332dd9a-de39-4f44-9aae-ea2603e3c6eb)

- The supported UJ-Type instructions and their OPCode:
- 
![UJ](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/cdc4720d-b291-4ffb-9dda-15148aa652eb)

And this is the Data Path of the processor connected to the Control Unit, Data Memory and Instruction Memory:

![Floooow](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/b98961fc-5a55-433a-8c9d-a6dfe1169575)


Finally, QuestaSim simulation environment was used to simulate the operation of the design and The project was tested by using a comprehensive set of various instruction formats to ensure its complete functionality.

I also used VIVADO to evaluate the RTL and the Synthesized design

![Elaboration](https://github.com/SherifMohamed2602/RISC-V-Processor/assets/115986078/83af68b8-6b31-41a2-8144-f918b55e4fd2)

