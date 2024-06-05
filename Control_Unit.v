`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:08:45 06/05/2024 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
  input[6:0] Opcode,
  output Branch, 
  output MemRead, 
  output MemtoReg, 
  output MemWrite, 
  output ALUSrc, 
  output RegWrite, 
  output [1:0] ALUOp 
);
	reg branch, memRead, memtoReg, memWrite, aLUSrc, regWrite;
	reg [1:0] aLUOp;
	
  always @(Opcode)
  begin
  //		R Type
    if(Opcode == 7'b0110011)
    begin
      aLUSrc <= 0;
      memtoReg <= 0;
      regWrite <= 1;
      memRead <= 0;
      memWrite <= 0;
      branch <= 0;
      aLUOp <= 2'b10;
    end
	 // LW
    else if(Opcode == 7'b0000011)
    begin
      aLUSrc <= 1;
      memtoReg <= 1;
      regWrite <= 1;
      memRead <= 1;
      memWrite <= 0;
      branch <= 0;
      aLUOp <= 2'b00;
    end
	 // SW
    else if(Opcode == 7'b0100011)
    begin
      aLUSrc <= 1;
      memtoReg <= 1;
      regWrite <=0;
      memRead <= 0;
      memWrite <= 1;
      branch <= 0;
      aLUOp <= 2'b00;
    end
	 // BEQ BNE
    else if(Opcode == 7'b1100011)
    begin
      aLUSrc <= 0;
      memtoReg <= 0;
      regWrite <=0;
      memRead <= 0;
      memWrite <= 0;
      branch <= 1;
      aLUOp <= 2'b01;
    end
    else
    begin
      aLUSrc <= 0;
      memtoReg <= 0;
      regWrite <=0;
      memRead <= 1;
      memWrite <= 0;
      branch <= 0;
      aLUOp <= 2'b00;
    end
  end
  
  assign Branch = branch; 
  assign MemRead=memRead;
  assign MemtoReg= memtoReg;
  assign MemWrite= memWrite;
  assign ALUSrc= aLUSrc;
  assign RegWrite= regWrite;
  assign ALUOp = aLUOp;
endmodule 
