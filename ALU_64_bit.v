module ALU_32_bit(
  input [31:0] a, 
  input [31:0] b, 
  input [3:0] ALUOp,
  output [31:0] Result, 
  output zero
);
	 reg [31:0] result;

    always @* begin
        case (ALUOp)
            // Branch equal: Subtract
            4'b0110: result = a - b;
            // R-type Add: Add
            4'b0010: result = a + b;
            // R-type Subtract: Subtract
            4'b0110: result = a - b;
            // R-type AND: AND
            4'b0000: result = a & b;
            // R-type OR: OR
            4'b0001: result = a | b;
            // R-type Set on less than: SLT
            4'b0111: result = (a < b) ? 32'b1 : 32'b0;
				//XOR Test
				4'b1111: 
				begin
					result = ALUOp ^ ALUOp;
            end
				
            default: result = 32'b0; // Default to 0 for unsupported operations
        endcase
    end

    assign zero = (result == 32'b0); // Output zero flag
    assign Result = result; // Output ALU result

endmodule