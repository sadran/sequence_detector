`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:53 03/01/2018 
// Design Name: 
// Module Name:    testbench_seq_detector 
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
module testbench_seq_detector(
    );
//inputs
reg clk = 0;
reg in_seq;
reg [1:0] seq_selector;
//outputs 
wire seq_detected;
wire [7:0] seq_num;
wire [1:0] state ;

reg [15:0] arr ;

seq_detector sd(clk, in_seq,seq_selector, seq_detected, seq_num, state);

always begin #10 clk=~clk; end 
initial begin 

arr = 16'b011001001001101010;
seq_selector = 1 ;
in_seq = arr[0]; #20;
in_seq = arr[1]; #20;
in_seq = arr[2]; #20;
in_seq = arr[3]; #20;
in_seq = arr[4]; #20;
in_seq = arr[5]; #20;
in_seq = arr[6]; #20;
in_seq = arr[7]; #20;
in_seq = arr[8]; #20;
in_seq = arr[9]; #20;
in_seq = arr[10]; #20;
in_seq = arr[11]; #20;
in_seq = arr[12]; #20;
in_seq = arr[13]; #20;
in_seq = arr[14]; #20;
in_seq = arr[15]; #20;
end
endmodule


