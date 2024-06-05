`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:59:29 06/04/2024 
// Design Name: 
// Module Name:    Instruction_Memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Instruction_Memory(
    input [31:0] address,
    output [31:0] instruction
);

    reg [31:0] memory [0:31]; // Modified index range to match the number of instructions

    initial begin
        // R-type instructions: ADD, SUB, OR, AND
        memory[0]  = 32'b0000000_00011_00010_000_00001_0110011; // ADD x1, x2, x3
        memory[1]  = 32'b0100000_00110_00101_000_00100_0110011; // SUB x4, x5, x6
        memory[2]  = 32'b0000000_01001_01000_111_00111_0110011; // AND x7, x8, x9
        memory[3]  = 32'b0000000_01100_01011_110_01010_0110011; // OR x10, x11, x12

        // I-type instruction: LW
        memory[4]  = 32'b000000000100_00010_010_00001_0000011; // LW x1, 4(x2)

        // S-type instruction: SW
        memory[5]  = 32'b000000000100_00111_010_00101_0100011; // SW x5, 4(x7)

        // B-type instruction: BNE
        memory[6]  = 32'b0000000_00001_00010_001_00011_1100011; // BNE x1, x2, 3 (offset is just an example)

        // Filling the rest of the memory with more instances of the specified instructions for demonstration
        memory[7]  = 32'b0000000_00011_00010_000_00001_0110011; // ADD x1, x2, x3
        memory[8]  = 32'b0100000_00110_00101_000_00100_0110011; // SUB x4, x5, x6
        memory[9]  = 32'b0000000_01001_01000_111_00111_0110011; // AND x7, x8, x9
        memory[10] = 32'b0000000_01100_01011_110_01010_0110011; // OR x10, x11, x12
        memory[11] = 32'b000000000100_00010_010_00001_0000011; // LW x1, 4(x2)
        memory[12] = 32'b000000000100_00111_010_00101_0100011; // SW x5, 4(x7)
        memory[13] = 32'b0000000_00001_00010_001_00011_1100011; // BNE x1, x2, 3 (offset is just an example)
        memory[14] = 32'b0000000_00011_00010_000_00001_0110011; // ADD x1, x2, x3
        memory[15] = 32'b0100000_00110_00101_000_00100_0110011; // SUB x4, x5, x6
			end
    //always @(address)
        assign instruction = memory[address[4:0]]; // Adjusted to access the correct memory index

endmodule
