//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:Yang Hou
// Date: 2021/6/16
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );

//Todo: Parameters
parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
    reg clk;
    reg err;
    reg [4:0] temp;
    wire heating;
    wire cooling;

//Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
    initial
    begin
	err = 0;
	temp = 5'd1;

	forever
	#(CLK_PERIOD + 20)
	begin
		if((temp<=18) && (heating!=1))
			begin			
			$display("heating fail");
			err = 1;
			end
		if((temp>=22)&&(cooling!=1))
			begin
			$display("cooling fail");
			err = 1;
			end
		if((18<temp<22)&&(heating!=0)&&(cooling!=0))
			begin
			$display("maintaing idle fail");
			err = 1;
			end
		temp = temp + 1;
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
    ACS top(
            .clk (clk),
            .temp (temp),
            .heating (heating),
            .cooling (cooling));


endmodule
