module instr_mem
// IO ports
(
    input wire [31:0] pc, 
    input wire reset,
    output wire [31:0] instr
);

// internal signal declaration
reg [7:0] rom [15:0];
wire [31:0] rom_output;
integer i;

// programming ROM with instructions
// expected output after 5 cycles: r10 = 17  
initial
begin
    // lw x6, -4(x9)
  rom[0]  = 8'b00000011;
  rom[1]  = 8'b10100011;
  rom[2]  = 8'b11000100;
  rom[3]  = 8'b11111111;
   // sw x6, 8(x9)
  rom[4]  = 8'b00100011;
  rom[5]  = 8'b10100100;
  rom[6]  = 8'b01100100;
  rom[7]  = 8'b00000000;
    // or x4, x5, x6
  rom[8]  = 8'b00110011;
  rom[9]  = 8'b11100010;
  rom[10] = 8'b01100010;
  rom[11] = 8'b00000000;
    // beq x4, x4, 7
  rom[12] = 8'b11100011;
  rom[13] = 8'b00001010;
  rom[14] = 8'b01000010;
  rom[15] = 8'b11111110;





end  

assign rom_output = {rom[pc+3], rom[pc+2], rom[pc+1], rom[pc]}; 
assign instr = rom_output;

endmodule
