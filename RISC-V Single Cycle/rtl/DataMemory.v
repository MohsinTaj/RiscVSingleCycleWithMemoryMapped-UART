module data_memory
// IO ports
(
    input wire clk, reset,
    input wire [31:0] addr, 
    input wire [31:0] write_data,
    input wire MemRead, MemWrite,
    output wire [31:0] read_data
);

// internal signal declaration
reg [7:0] ram [63:0];      // byte addressable memory
wire [31:0] read_word;
integer i;

// body
always @(posedge clk, posedge reset)
begin
    if(reset)
        ram[i] <= 8'b0;
    else
        begin
            // write operation
            if(MemWrite)
                begin
                    {ram[addr+3],ram[addr+2], ram[addr+1], ram[addr+0]}= write_data;
                end
        end
end

// read
assign ram_output = {ram[addr+3], ram[addr+2], ram[addr+1], ram[addr]};
assign read_data =  ram_output ;

endmodule