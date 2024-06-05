`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:01:32 06/05/2024 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(

  input[4:0] rs1, 
  input[4:0] rs2, 
  input[4:0] rd, 
  input[31:0] writeData, 
  input regWrite, 
  input clk, 
  input reset,
  output[31:0] ReadData1,
  output [31:0] ReadData2 
);
  reg [31:0] registerArr [31:0];
  always @(posedge reset or posedge clk)
  begin
    if(reset)
      begin
        registerArr[0] = 32'd0;
        registerArr[1] = 32'd0;
        registerArr[2] = 32'd0;
        registerArr[3] = 32'd0;
        registerArr[4] = 32'd0;
        registerArr[5] = 32'd0;
        registerArr[6] = 32'd0;
        registerArr[7] = 32'd0;
        registerArr[8] = 32'd0;
        registerArr[9] = 32'd0;
        registerArr[10] = 32'd15;
        registerArr[11] = 32'd0;
        registerArr[12] = 32'd0;
        registerArr[13] = 32'd0;
        registerArr[14] = 32'd0;
        registerArr[15] = 32'd0;
        registerArr[16] = 32'd0;
        registerArr[17] = 32'd0;
        registerArr[18] = 32'd0;
        registerArr[19] = 32'd0;
        registerArr[20] = 32'd0;
        registerArr[21] = 32'd4;
        registerArr[22] = 32'd0;
        registerArr[23] = 32'd0;
        registerArr[24] = 32'd0;
        registerArr[25] = 32'd0;
        registerArr[26] = 32'd0;
        registerArr[27] = 32'd0;
        registerArr[28] = 32'd0;
        registerArr[29] = 32'd0;
        registerArr[30] = 32'd0;
        registerArr[31] = 32'd0;
      end
    else
    begin
      if(regWrite)
      begin
        registerArr[rd] <= writeData;
      end
    end
  end
  assign ReadData1 = registerArr[rs1];
  assign ReadData2 = registerArr[rs2];
endmodule 