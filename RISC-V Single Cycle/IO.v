module Memory_IO # (parameter Width = 32)(
    input clk, WE1,
    input [Width-1:0] WriteData, address,
    output reg [Width-1:0] RData1
);
    reg [7:0] mem[63:0];
    integer i;
    initial begin
        for (i=0; i<32; i=i+1)
            mem[i] = i;
        
      
    end
        assign RData1 = { 8'b00000000, 8'b00000000, mem[address+1], mem[address]};
   

    always @(posedge clk) begin
        if (WE1) begin
          {mem[address+3], mem[address+2], mem[address+1], mem[address]} = WriteData;
     
        end
    end

endmodule

