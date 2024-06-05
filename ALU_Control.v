`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:18:40 06/05/2024 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(
  input[1:0] ALUOp, 
  input [3:0] Funct,
  output [3:0] Op
);
	reg Operation;
  always @(ALUOp or Funct)
  begin
    if(ALUOp == 2'b00)
      Operation <= 4'b0010;
    else if(ALUOp == 2'b01)
      Operation <= 4'b0110;
    else if(ALUOp == 2'b10)
    begin
      if(Funct == 4'b0000)
        Operation <= 4'b0010;
      else if(Funct == 4'b1000)
        Operation <= 4'b0110;
      else if(Funct == 4'b0111)
        Operation <= 4'b0000;
      else if(Funct == 4'b0110)
        Operation <= 4'b0001;
    end
  end
  
  assign Op= Operation;
endmodule 
