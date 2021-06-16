//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:Yang HOU
// Date: 2021/6/16
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module ACS (
	//add ports
	input clk,
	input [4:0] temp,
	
	output heating,
	output cooling
	);

	//add registers and wires if required
	reg [1:0] state;

	//heating on = 10, cooling on = 01, idle = 00        
	assign heating = state[1];
	assign cooling = state[0];

	//add logic
	always @(posedge clk)
	begin
		case(state)
                2'b10 : state = temp<20 ? 2'b10 : 2'b00;
                2'b01 : state = temp>20 ? 2'b01 : 2'b00;
		2'b00 : state = temp<=18 ? 2'b10 : temp>=22 ? 2'b01 : 2'b00;

		default: state = 2'b00;
		endcase
	end
endmodule
        
