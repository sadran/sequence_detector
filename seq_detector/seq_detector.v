`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:34 03/01/2018 
// Design Name: 
// Module Name:    seq_detector 
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
module seq_detector(
		input clk,
		input in_seq,
		input [1:0] seq_selector,
		output reg seq_detected,
		output reg [7:0] seq_num, 
		output reg [1:0] state
    );

//reg [1:0] state;
initial begin 
	state <= 2'b00;
	seq_num <= 8'h00;
	seq_detected <= 0;
	//seq_selector <= 2'b00;
	end 

always @(posedge clk) begin 
	seq_detected <= 0;
	
case (seq_selector)
0:begin   // sequence 1001
		case (state)
			0 : state <= in_seq ? 1 : 0 ;
			1 : state <= in_seq ? 1 : 2 ;
			2 : state <= in_seq ? 1 : 3 ;
			3 : begin 
				state <= in_seq ? 1 : 0 ;
				seq_detected <= in_seq ? 1 : 0;
				seq_num <= in_seq ? seq_num+1 : seq_num ;
				end
		endcase 
	end
	
1:begin  // sequence 1100
		case (state)
			0 : state <= in_seq ? 1 : 0 ;
			1 : state <= in_seq ? 2 : 0 ;
			2 : state <= in_seq ? 2 : 3 ;
			3 : begin 
				state <= in_seq ? 1 : 0 ;
				seq_detected <= in_seq ? 0 : 1;
				seq_num <= in_seq ? seq_num : seq_num+1 ;
				end
		endcase 
 end
 
2:begin  // sequence 0110 
		case (state)
			0 : state <= in_seq ? 0 : 1 ;
			1 : state <= in_seq ? 2 : 1 ;
			2 : state <= in_seq ? 3 : 1 ;
			3 : begin 
				state <= in_seq ? 0 : 1 ;
				seq_detected <= in_seq ? 0 : 1;
				seq_num <= in_seq ? seq_num : seq_num+1 ;
				end
		endcase 
end 

3:begin  //sequence  1010
		case (state)
			0 : state <= in_seq ? 1 : 0 ;
			1 : state <= in_seq ? 1 : 2 ;
			2 : state <= in_seq ? 3 : 0 ;
			3 : begin 
				state <= in_seq ? 0 : 1 ;
				seq_detected <= in_seq ? 0 : 1;
				seq_num <= in_seq ? seq_num : seq_num+1 ;
				end
		endcase 
end 
endcase 
end 

endmodule
