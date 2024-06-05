`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:11:55 06/05/2024
// Design Name:   Top_Level
// Module Name:   D:/CSA Project/RISCV_Project/32 Bit/RISC_V_32/Top_level_tb.v
// Project Name:  RISC_V_32
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_Level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_level_tb;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [31:0] PC;
    wire [31:0] Instruction;
    wire [31:0] WriteData;

    // Instantiate the Unit Under Test (UUT)
    Top_Level uut (
        .clk(clk), 
        .reset(reset), 
        .PC(PC), 
        .Instruction(Instruction),
        .WriteData(WriteData)
    );
    
    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 ns
    end

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        #10;
        reset = 0; // Deassert reset

        // Add stimulus here
        #100; // Run simulation for additional 100 ns
    end


endmodule
