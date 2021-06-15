//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:Yang Hou
// Date: 2021/6/15
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );

//Todo: Parameters
parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
    reg rst;
    reg button;
    reg clk;
    reg err;
    reg [2:0] color_pre;
    wire [2:0] color;

//Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: Botton generation
    initial
    begin
       button = 1'b0;
       forever
         #(CLK_PERIOD/2) button=~button;
    end
//Todo: User logic
    initial 
    begin
    rst = 1;
    button = 0;
    err = 0;
       forever
       #(CLK_PERIOD)
       begin
            if ((rst == 1) && (color != 3'b001))
               begin
                    $display("TEST FAILED");
                    err = 1;
               end
            
            rst = 0;	
            color_pre = color;

            if((button == 0) && (color_pre != color))
			begin
			     $display("TEST FAILED");
			     err = 1;
			end

            button = 1;
	    color_pre = color;

            if((button == 1) && (color != color_pre +1))
                        begin
				$display("TEST FAILED");
				err = 1;
			end
       end
    end

//Todo: Finish test, check for success
	initial begin
	  #100
	  if (err == 0)
		$display("***TEST PASSED! :) ***");
   	  $finish;
	end

//Todo: Instantiate counter module
	     LED top(
		.clk (clk),
		.rst (rst),
 		.button (button),
		.color (color));
 endmodule 

    
