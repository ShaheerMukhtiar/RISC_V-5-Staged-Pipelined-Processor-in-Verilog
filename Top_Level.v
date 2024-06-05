`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:47:58 06/05/2024 
// Design Name: 
// Module Name:    Top_Level 
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
module Top_Level(
	input clk,
	input reset,
	
	output[31:0] PC,
	output [31:0] Instruction,
	output [31:0] WriteData,
	output [31:0] ALU_Results
    );
 wire [31:0] pc_mux_out;

 // PC
PC pc(.clk(clk), .reset(reset),
  .PC_In(pc_mux_out),
  .PC_Out(PC)
	);
	
	// PC ADDER
	wire [31:0] adder_out;
Adder adder(
  .a(PC), 
  .b(1),
  .out(adder_out)
  );

	// Instruction Fetch
Instruction_Memory inst_mem(
    .address(PC),
    .instruction(Instruction)
);

		wire [31:0] BranchPC_In;
		wire pc_sel;
	// PC Select mux
mux pc_select(
  .in1(adder_out),
  .in2(BranchPC_In),
  .sel(pc_sel),
  .out(pc_mux_out)
);

	wire [31:0]PC_IF, Instruction_IF;
	// IF Register
IDRegister if_id(
  .PC_in(PC),
  .ins_in(Instruction),
  .clk(clk),
  .reset(reset),
  .PC_out(PC_IF), 
  .ins_out(Instruction_IF) 
);

	wire [6:0] opcode,funct7; wire [4:0]rd,rs1,rs2; wire [2:0] funct3;
	wire [11:0] imm;
// Instruction Decoder
Decoder decoder(

  .Instruction(Instruction_IF),
  .opcode(opcode),
  .rd(rd),.rs1(rs1),.rs2(rs2),
  .funct3(funct3),
  .funct7 (funct7),
  .imm(imm)
);

	wire branch,memRead,memToReg,memWrite,regWrite,aluSrc;
	wire [1:0] aluOp;
// Control Unit
Control_Unit control(

  .Opcode(opcode),
  .Branch(branch), 
  .MemRead(memRead), 
  .MemtoReg(memToReg), 
  .MemWrite(memWrite), 
  .ALUSrc(aluSrc), 
  .RegWrite(regWrite), 
  .ALUOp (aluOp)
);

	wire[31:0] ReadData1,ReadData2;
// Reg File
RegisterFile regFile(

  .rs1(rs1), 
  .rs2(rs2), 
  .rd(rd), 
  .writeData(WriteData), 
  .regWrite(regWrite), 
  .clk(clk), .reset(reset),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2) 
);
	wire [31:0] imm_extended;
	// Sign Extender
Sign_Entender signExtend(
		.immediate(imm),
		.signExtend(imm_extended)
    );
	 
		wire [31:0] PC_out,data1_out,data2_out,immData_out;
		wire [4:0] rs1_out,  rs2_out, rd_out;
		wire [3:0] Funct_out;
		wire Branch_out, MemRead_out, MemtoReg_out, MemWrite_out, ALUSrc_out, RegWrite_out;
		wire [1:0] ALUOp_out ;
			
	// EX Register
EXRegister	ID_EX(

  .PC_in(PC_IF),
  .data1_in(ReadData1),
  .data2_in(ReadData2),
  .immData_in(imm_extended), 
  .rs1_in(rs1), 
  .rs2_in(rs2), 
  .rd_in(rd),
  .Funct_in({Instruction_IF[31],funct3}),
  .Branch_in(branch), .MemRead_in(memRead), 
  .MemtoReg_in(memToReg), .MemWrite_in(memWrite), 
	.ALUSrc_in(aluSrc),.RegWrite_in(regWrite), 
	 .ALUOp_in(aluOp), 
	 .clk(clk),. reset(reset),
	 
   .PC(PC_out),
   .data1(data1_out),
   .data2(data2_out),
   .immData(immData_out), 
   .rs1(rs1_out), 
   .rs2(rs2_out), 
   .rd(rd_out),
   .Funct(Funct_out),
	.Branch(Branch_out),.MemRead(MemRead_out), 
	.MemtoReg(MemtoReg_out),.MemWrite(MemWrite_out), 
	.ALUSrc(ALUSrc_out),.RegWrite(RegWrite_out),
	.ALUOp(ALUOp_out) 

);

  wire [3:0] Op;
	// Alu Control
ALU_Control aluCt(
	.ALUOp(ALUOp_out), 
	.Funct(Funct_out), 
	.Op(Op)
);

		// Adder 1
Adder adder1(
		.a(PC_out), 
		.b(immData_out), 
		.out(BranchPC_In)
  );
  
  wire [31:0] aluResultMEM,updatedData1 ;
  wire [1:0] ForwardA;
  // Data one forwarding MUX
  mux2 data1ForwardingMux (
	  .in1(data1_out), 
	  .in2(WriteData), 
	  .in3(aluResultMEM), 
	  .sel(ForwardA), 
	  .out(updatedData1)
  );
  
  wire [1:0] ForwardB;
  wire [31:0] updatedData2;
  // Data 2 Forwarding Mux
  mux2 data2ForwardingMux (
	  .in1(data2_out), 
	  .in2(WriteData),
	  .in3(aluResultMEM),
	  .sel(ForwardB), 
	  .out(updatedData2)
  );
  
  wire rdMEM,rdWB,RegWriteMEM,RegWriteWB;
  // Forwarding Unit
  ForwardingUnit fwd(
	  .rdMem(rdMEM), 
	  .regWriteMem(RegWriteMEM), 
	  .rdWb(rdWB),
	  .regWriteWb(RegWriteWB), 
	  .rs1(rs1_out), .rs2(rs2_out), 
	  .For_A(ForwardA), 
	  .For_B(ForwardB)
  );
  
  wire [31:0]ReadData3;
	// ALU source Mux
  mux aluSrcMux(
	  .in1(updatedData2), 
	  .in2(immData_out), 
	  .out(ReadData3), 
	  .sel(ALUSrc_out)
  );
  
  wire zero;
  // Main ALU
 ALU_32_bit main_alu(
  .a(updatedData1), 
  .b(ReadData3), 
  .ALUOp(Op),
  .Result(ALU_Results), 
  .zero(zero)
);

  
  wire[31:0] pcMEM,data2MEM;
  wire BranchMEM,MemReadMEM, MemtoRegMEM,MemWriteMEM, zeroMEM;

  
	 //MEMRegister
  MEMRegister memReg(
		.clk(clk), 
	  .reset(reset), 
	  .PC_in(BranchPC_In),
	  .aluResult_in(ALU_Results), 
	  .data2_in(updatedData2),
		.rd_in(rd_out), 
		.Branch_in(Branch_out), 
		.MemRead_in(MemRead_out), 
		.MemtoReg_in(MemtoReg_out), 
		.MemWrite_in(MemWrite_out), 
		.RegWrite_in(RegWrite_out), 
		.zero_in(zero),
							 
		
		 .aluResult(aluResultMEM), 
		 .data2(data2MEM), 
		 .rd(rdMEM),
		 .Branch(BranchMEM), 
		 .MemRead(MemReadMEM),
		 .MemtoReg(MemtoRegMEM), 
		 .MemWrite(MemWriteMEM),
		 .RegWrite(RegWriteMEM),
		 .PC(pcMEM), 
		 .zero(zeroMEM)
	 );


  //Memory Stage
  assign shouldBranch = BranchMEM;
  assign shouldBranch = zeroMEM;
  
  wire [31:0] MemRead_Data;
Data_Memory data_mem(
  .Mem_Addr(aluResultMEM), 
  .Write_Data(data2MEM), 
  .clk(clk),.MemWrite(MemWriteMEM),
  .MemRead(MemReadMEM),
  .Read_Data(MemRead_Data) 
);
  
    // Branch AND
  
 Branch_AND b_and(
	.branch(BranchMEM),
	.zero(zeroMEM),
	.pc_select(pc_sel)
	);
  
	wire [31:0] aluResultWB,MemRead_DataWB;
	wire MemtoRegWB;
			
  //WriteBack Stage
  WBRegister wbReg(
  .clk(clk), 
  .reset(reset),
  .aluResult_in(aluResultMEM), 
  .memData_in(MemRead_Data), 
  .rd_in(rdMEM), 
  .MemtoReg_in(MemtoRegMEM), 
  .RegWrite_in(RegWriteMEM),
                   
  .aluResult(aluResultWB), 
  .memData(MemRead_DataWB), 
  .rd(rdWB),
  .MemtoReg(MemtoRegWB), 
  .RegWrite(RegWriteWB));
  
	
  // Mem to reg Mux
  mux memRegMux(
	  .in1(aluResultWB), 
	  .in2(MemRead_DataWB), 
	  .out(WriteData), 
	  .sel(MemtoRegWB)
  );
  

endmodule 