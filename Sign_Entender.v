`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:36:31 06/05/2024 
// Design Name: 
// Module Name:    Sign_Entender 
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
module Sign_Entender(
		input[11:0]immediate,
		output[31:0] signExtend
    );
	  assign signExtend = {{20{immediate[11]}}, immediate};

endmodule 