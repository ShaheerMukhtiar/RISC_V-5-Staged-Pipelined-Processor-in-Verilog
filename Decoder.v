`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:29:25 06/05/2024 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(

  input [31:0] Instruction,
  output [6:0] opcode,
  output [4:0] rd,
  output [2:0] funct3,
  output [4:0] rs1,
  output [4:0] rs2,
  output [6:0] funct7,
  output [11:0] imm
);

  assign opcode = Instruction[6:0];
  assign rd = Instruction[11:7];
  assign funct3 = Instruction[14:12];
  assign rs1 = Instruction[19:15];
  assign rs2 = Instruction[24:20];
  assign funct7 = Instruction[31:25];
  
  assign imm = Instruction[31:20];
  
endmodule 