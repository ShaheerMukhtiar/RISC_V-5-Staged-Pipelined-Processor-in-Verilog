module Data_Memory(
  input [31:0] Mem_Addr, 
  input [31:0] Write_Data, 
  input clk,input MemWrite,
  input MemRead,
  output[31:0] Read_Data 
);
reg [31:0] readData1=0;


    // Create memory array
    reg [31:0] memory [0:31];
	   integer i;
		initial begin
              for (i = 0; i < 32; i = i + 1) begin
            //memory[i] = 32'b0; // Initialize with all zeroes
            // Alternatively, you can initialize with some specific value:
            memory[i] = 100 + (1 * 10); // For example, initialize with i*10
        end
    end
    // Read operation
    always @(*) begin
        if (MemRead)
            readData1 <= memory[Mem_Addr];
        else
            readData1<= 32'b0; // Default value if not reading
    end

    // Write operation
    always @(posedge clk) begin
        if (MemWrite)
            memory[Mem_Addr] <= Write_Data;
    end
	
	assign Read_Data =readData1;
endmodule