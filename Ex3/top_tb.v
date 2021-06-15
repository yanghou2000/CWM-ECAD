//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:Yang Hou
// Date: 2021/6/15
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10;
//Todo: Regitsers and wires
    reg rst;
    reg change;
    reg on_off;
    reg clk;
    reg err;
    
    reg [7:0] counter_pre;
    wire counter_out;
//Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
//Todo: User logic
    initial begin
    rst = 1;
    change = 0;
    on_off = 0;
    err = 0;
    counter_pre = counter_out;
      forever
      begin
        if((on_off == 1) && (counter_out < counter_pre))  
			begin
				$display("TEST FAILED: not counting up");
				err = 1;
			end
        if((on_off == 0) && (counter_out > counter_pre))
                        begin    
                                $display("TEST FAILED: not counting down");
                                err = 1;
                        end
        if((change == 1) && (counter_out != counter_pre))
                        begin   
                                $display("TEST FAILED: not holding constant");  
                                err = 1;
                        end
        
        begin
           counter_pre = counter_out;
           change = change + 1;
           on_off = on_off +1;
        end
      end
      
      forever
      begin
        if((rst == 1) && (counter_out != 0))
                        begin 
                                $display("TEST FAILED: not retting to 0");
                                err = 1;
                        end
        begin
            counter_pre = counter_out;
            rst = rst - 1;
        end
      end
    end
                         
//Todo: Finish test, check for success
      initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
//Todo: Instantiate counter module
 	monitor top(
		.clk (clk),
		.rst (rst),
 		.change (change),
		.on_off (on_off),
		.counter_out (counter_out));
endmodule 
