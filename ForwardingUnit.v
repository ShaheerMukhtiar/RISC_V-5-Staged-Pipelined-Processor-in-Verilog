module ForwardingUnit(
  input [4:0] rdMem,
  input regWriteMem, 
  input [4:0] rdWb, 
  input regWriteWb, 
  input [4:0] rs1, 
  input [4:0] rs2,
  output [1:0] For_A, 
  output [1:0] For_B
);
		reg [1:0] ForwardA;
		reg [1:0] ForwardB;
	  always @(rdMem or rdWb or regWriteMem or regWriteWb or rs1 or rs2)
	  begin
		 if (regWriteMem && (rdMem !== 5'b0) && (rdMem === rs2))
			ForwardB = 2'b10;
		 else if (regWriteWb && (rdWb !== 5'b0) && (rdWb === rs2))
			ForwardB <= 2'b01;
		 else
			ForwardB <= 2'b00;

		 
		 if (regWriteMem && (rdMem !== 5'b0) && (rdMem === rs1))
			ForwardA <= 2'b10;
		 else if (regWriteWb && (rdWb !== 5'b0) && (rdWb === rs1))
			ForwardA <= 2'b01;
		 else
			ForwardA <= 2'b00;
	  end
	  assign For_A = ForwardA;
	  assign For_B = ForwardB;
endmodule 