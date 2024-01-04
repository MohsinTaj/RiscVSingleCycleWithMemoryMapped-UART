module mux2_1 #(parameter Width = 32)(input [Width-1 : 0] a,b,
 input  [1:0]s,
 output [Width-1 : 0] out);

assign out = (s == 2'b00) ? a : b;
endmodule
