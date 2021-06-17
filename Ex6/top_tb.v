//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:Yang Hou
// Date: 2021/6/17
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );

//Todo: Parameters
	parameter CLK_PERIOD = 10;
 	
//Todo: Regitsers and wires
	reg clk;
	reg enable;
	reg err;
	
	reg [2:0] color;
	wire [23:0] rgb;
	
//Todo: Clock generation
	initial
		begin
		    clk = 0;
		    forever
		      #(CLK_PERIOD/2) clk=~clk;//flip the clock signal every half period
		end			
//Todo: User logic
	initial 
	begin
	err = 0;
	enable = 0;
	color = 3'b000;
	#CLK_PERIOD
	enable = 1;
	forever begin
	 #CLK_PERIOD
		
		if((color[0] != (&rgb[7:0])) || (color[1] != (&rgb[15:8])) || (color[2] != (&rgb[23:16])))
			begin
			  $display("TEST FAILED bit conversion");
			  err = 1;
			end
		
		color = color + 3'b001;
		end
	end
	
//Todo: Finish test, check for success
	initial begin
	  #500
	  if (err == 0)
		$display("***TEST PASSED! :) ***");
   	  $finish;
	end




//Todo:Instantiate counter module
	 RGB top(
		.clk (clk),
		.enable (enable),
		.color (color),
		.rgb (rgb)
		);
endmodule
