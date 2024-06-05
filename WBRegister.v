module WBRegister(
			input[31:0] aluResult_in,
			input[31:0] memData_in,
			input[4:0] rd_in,
			input MemtoReg_in,
			input RegWrite_in,
			input clk,input reset,
			
			output [31:0] aluResult,
			output[31:0] memData,
			output[4:0] rd,
			output MemtoReg,output RegWrite

);
			reg [31:0] aluResult_out,memData_out;
         reg [4:0] rd_out;
         reg MemtoReg_out, RegWrite_out;

  always @(posedge reset or posedge clk)
  begin
    if(reset)
      begin
        aluResult_out <= 64'b0;
        memData_out <= 64'b0;
        rd_out <= 5'b0;
        MemtoReg_out <= 1'b0;
        RegWrite_out <= 1'b0;
      end
    else
      begin
        aluResult_out <= aluResult_in;
        memData_out <= memData_in;
        rd_out <= rd_in;
        MemtoReg_out <= MemtoReg_in;
        RegWrite_out <= RegWrite_in;
      end
  end
  
	assign aluResult=aluResult_out;
	assign memData=memData_out;
	assign rd=rd_out;
	assign MemtoReg=MemtoReg_out;
	assign RegWrite = RegWrite_out;
endmodule 