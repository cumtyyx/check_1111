`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:43 03/19/2019
// Design Name:   check_1111
// Module Name:   C:/myfpga/project/check_1111/testbench/vtf_check_1111.v
// Project Name:  check_1111
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: check_1111
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vtf_check_1111;

	// Inputs
	reg x;
	reg clk;
	reg rst;
	reg [23:0] data;
	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	check_1111 uut (
		.x(x), 
		.clk(clk), 
		.rst(rst), 
		.z(z)
	);

	initial begin
		x = 0;
		clk = 0;
		rst = 1;
		data = 'b1100_0011_1101_0110_0111_1011;
		#20 rst = 0;
		#10 rst = 1;
	end
      always #50 clk = ~clk;
	  always @ (posedge clk)
		begin
			x <= data[23];
			data <= {data[22:0],data[23]};
		end
endmodule

