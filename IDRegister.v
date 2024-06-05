`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:08:11 06/05/2024 
// Design Name: 
// Module Name:    IDRegister 
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
module IDRegister(
  input [31:0] PC_in,
  input [31:0] ins_in,
  input clk,
  input reset,
  output [31:0] PC_out, 
  output [31:0] ins_out 
);
	reg [31:0] pc,ins;
  always @(posedge reset or posedge clk)
  begin
    if(reset)
      begin
        ins <= 32'b0;
        pc <= 32'b0;
      end
    else
      begin
        pc <= PC_in;
        ins <= ins_in;
      end
  end
  assign PC_out = pc;
  assign ins_out = ins;
endmodule 