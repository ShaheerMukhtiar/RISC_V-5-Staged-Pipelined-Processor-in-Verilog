module MEMRegister(
  input [31:0] PC_in,
            input [31:0] aluResult_in,
            input [31:0] data2_in,
             input [4:0] rd_in,
             input Branch_in, input MemRead_in,input MemtoReg_in,input MemWrite_in,input RegWrite_in,input zero_in,
             input clk,input reset,
				 
				 
  output[31:0] PC,
  output[31:0] aluResult,
  output[31:0] data2,
  output[4:0] rd,
  output Branch, output MemRead, output MemtoReg,output MemWrite,output RegWrite,output zero

);
		   reg [31:0] PC_out;
         reg [31:0] aluResult_out;
         reg [31:0] data2_out;
         reg [4:0] rd_out;
         reg Branch_out, MemRead_out, MemtoReg_out, MemWrite_out,RegWrite_out,zero_out;
			
  always @(posedge reset or posedge clk)
  begin
    if(reset)
      begin
        PC_out <= 64'b0;
        aluResult_out <= 64'b0;
        data2_out <= 64'b0;
        rd_out <= 5'b0;
        Branch_out <= 1'b0;
        MemRead_out <= 1'b0;
        MemtoReg_out <= 1'b0;
        MemWrite_out <= 1'b0;
        RegWrite_out <= 1'b0;
        zero_out <= 1'b0;
      end
    else
      begin
        PC_out <= PC_in;
        aluResult_out <= aluResult_in;
        data2_out <= data2_in;
        rd_out <= rd_in;
        Branch_out <= Branch_in;
        MemRead_out <= MemRead_in;
        MemtoReg_out <= MemtoReg_in;
        MemWrite_out <= MemWrite_in;
        RegWrite_out <= RegWrite_in;
        zero_out <= zero_in;
      end
  end
  
		assign PC=PC_out;
		assign aluResult= aluResult_out;
		assign data2 = data2_out;
		assign rd= rd_out;
		assign Branch= Branch_out;
		assign MemRead=MemRead_out;
		assign MemtoReg=MemtoReg_out;
		assign  MemWrite=  MemWrite_out;
		assign RegWrite= RegWrite;
		assign zero= zero_out;
endmodule 