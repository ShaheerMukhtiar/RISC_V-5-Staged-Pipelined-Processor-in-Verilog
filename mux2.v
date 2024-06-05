`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:19:49 06/05/2024 
// Design Name: 
// Module Name:    mux2 
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
module mux2(
  input [31:0] in1,
  input [31:0] in2, 
  input [31:0]  in3, 
  input [1:0] sel,
  output [31:0] out
);
  wire [31:0] tempResult;
  mux m1 (.in1(in1), .in2(in2), .sel(sel[0]), .out(tempResult));
  mux m2 (.in1(tempResult), .in2(in3), .sel(sel[1]), .out(out));
endmodule 
