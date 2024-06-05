`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:34 06/05/2024 
// Design Name: 
// Module Name:    Branch_AND 
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
 module Branch_AND(
	input branch,
	input zero,
	input pc_select
	);
	
	assign pc_select = branch & zero;
	
	endmodule
  
