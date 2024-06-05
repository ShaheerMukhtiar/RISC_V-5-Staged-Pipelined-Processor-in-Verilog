`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:37:09 06/04/2024 
// Design Name: 
// Module Name:    PC 
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
module PC(
  input clk, 
  input reset, 
  input [31:0] PC_In,
  output [31:0] PC_Out
);
	reg [31:0]pc_out;
  always @(posedge reset or posedge clk)
  begin
    if(reset)
      pc_out<= 31'd0;
    else
      pc_out <= PC_In;
  end
  assign PC_Out = pc_out;
endmodule 

