//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name:Yang Hou
// Date: 2021/6/17
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module RGB(
	// ports
	input clk,
	input [2:0] color,
	input enable,

	output [23:0] rgb
	);

  
mytruebram RGB (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [2 : 0] addra
  .dina(dina),    // input wire [23 : 0] dina
  .douta(douta)  // output wire [23 : 0] douta
);

endmodule
