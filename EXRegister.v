`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:24:38 06/05/2024 
// Design Name: 
// Module Name:    EXRegister 
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
module EXRegister(
  input [31:0] PC_in,
  input[31:0] data1_in,
  input[31:0] data2_in,
  input[31:0] immData_in, 
  input[4:0] rs1_in, 
  input[4:0] rs2_in, 
  input[4:0] rd_in,
  input[3:0] Funct_in,
	 input Branch_in, input MemRead_in, 
	 input MemtoReg_in, input MemWrite_in, 
	 input ALUSrc_in, input RegWrite_in, 
	 input[1:0] ALUOp_in, 
	 input clk, input reset,
	 
   output[31:0] PC,
   output[31:0] data1,
   output[31:0] data2,
   output[31:0] immData, 
   output[4:0] rs1, 
   output[4:0] rs2, 
   output[4:0] rd,
   output[3:0] Funct,
          output Branch, output MemRead, 
			 output MemtoReg, output MemWrite, 
			 output ALUSrc, output RegWrite,
          output [1:0] ALUOp 

);
	
	reg [31:0] PC_out,data1_out,data2_out,immData_out;
         reg [4:0] rs1_out,  rs2_out, rd_out;
         reg [3:0] Funct_out;
         reg Branch_out, MemRead_out, MemtoReg_out, MemWrite_out, ALUSrc_out, RegWrite_out;
         reg [1:0] ALUOp_out ;

  always @(posedge reset or posedge clk)
  begin
    if(reset)
      begin
        PC_out <= 64'b0;
        data1_out <= 64'b0;
        data2_out <= 64'b0;
        immData_out <= 64'b0;
        rs1_out <= 5'b0;
        rs2_out <= 5'b0;
        rd_out <= 5'b0;
        Funct_out <= 4'b0;
        Branch_out <= 1'b0;
        MemRead_out <= 1'b0;
        MemtoReg_out <= 1'b0;
        MemWrite_out <= 1'b0;
        ALUSrc_out <= 1'b0;
        RegWrite_out <= 1'b0;
        ALUOp_out <= 2'b0;
      end
    else
      begin
        PC_out <= PC_in;
        data1_out <= data1_in;
        data2_out <= data2_in;
        immData_out <= immData_in;
        rs1_out <= rs1_in;
        rs2_out <= rs2_in;
        rd_out <= rd_in;
        Funct_out <= Funct_in;
        Branch_out <= Branch_in;
        MemRead_out <= MemRead_in;
        MemtoReg_out <= MemtoReg_in;
        MemWrite_out <= MemWrite_in;
        ALUSrc_out <= ALUSrc_in;
        RegWrite_out <= RegWrite_in;
        ALUOp_out <= ALUOp_in;
      end
  end
  
   assign PC=PC_out;
   assign data1=data1_out;
   assign data2= data2_out;
   assign immData= immData_out; 
   assign rs1= rs1_out; 
   assign rs2= rs2_out; 
   assign rd=rd_out;
   assign Funct= Funct_out;
   assign Branch= Branch_out; 
	assign MemRead= MemRead_out;
	assign MemtoReg=MemtoReg_out; 
	assign MemWrite= MemWrite_out; 
	assign ALUSrc= ALUSrc_out; 
	assign RegWrite= RegWrite_out;
   assign ALUOp= ALUOp_out; 
  
endmodule 
