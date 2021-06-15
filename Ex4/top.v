//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:Yang Hou
// Date: 2021/6/15
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module LED (
    //Todo: add ports 
    input rst,
    input clk,
    input button,
    output [2:0] color
    );  

    //Todo: add registers and wires, if needed
    output reg [2:0] color;

    //Todo: add user logic
    always @(posedge clk)
    begin
         if (rst)
            #1 color <= 3'b001;
         else
             begin
             if (button == 0)
                color <= color;
             else
                 if (color == 3'b001)
                   #1 color <= 3'b010;
                 if (color == 3'b010)
                   #1 color <= 3'b011;
                 if (color == 3'b011)
                   #1 color <= 3'b100;
                 if (color == 3'b100)
                   #1 color <= 3'b101;
                 if (color == 3'b101)
                   #1 color <= 3'b110;
                 if (color == 3'b110)
                   #1 color <= 3'b001;
             end
    end  
endmodule                      
             
