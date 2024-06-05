`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:47:01 06/04/2024 
// Design Name: 
// Module Name:    mux 
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
module mux(
  input [31:0] in1,
  input [31:0] in2,
  input sel,
  output [31:0] out
);
	reg [31:0] ouput;
  always @(in1 or in2 or sel)
  begin
    if (sel)
      ouput <= in2;
    else
      ouput <= in1;
  end
  assign out = ouput;
endmodule 