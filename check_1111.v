`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:26 03/19/2019 
// Design Name: 
// Module Name:    check_1111 
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
module check_1111(x,clk,rst,z
    );
	input x,clk,rst;
	output z;
	reg z;
	reg [4:0] state,next_state;
	
	parameter
			idle = 5'b00001,
			s1 = 5'b00010,
			s2 = 5'b00100,
			s3 = 5'b01000,
			s4 = 5'b10000;
		
	always @ (posedge clk or negedge rst)
		begin
			if(!rst)
				state <= idle;
			else
				state <= next_state;
		end
	/*always@(*)里面的敏感变量为*，意思是说敏感变量由综合器
	     根据always里面的输入变量自动添加，不用自己考虑。*/
	always @ (*)
		begin
			case(state)
				idle: next_state = (x==1)? s1:idle;
				s1: next_state = (x==1)? s2:idle;
				s2: next_state = (x==1)? s3:idle;
				s3: next_state = (x==1)? s4:idle;
				s4: next_state = (x==1)? s4:idle;
			endcase
		end
	always @ (posedge clk or negedge rst)
		begin
			if(!rst)
				z <= 0;
			else
				case(next_state)
					idle: z <= 0;
					s1: z <= 0;
					s2: z <= 0;
					s3: z <= 0;
					s4: z <= 1;
				endcase
		end

endmodule
