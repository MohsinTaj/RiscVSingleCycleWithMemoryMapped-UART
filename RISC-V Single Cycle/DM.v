module mem # (parameter Width = 32)(
    input clk, WEM,
    input [Width-1:0] WriteData, address,
    output reg [Width-1:0] RData0
);

    reg [7:0] mem[63:0];

    integer i;

    initial begin
        for (i=0; i<32; i=i+1)
            mem[i] = i;
        
      
    end
        assign RData0 = {mem[address+3], mem[address+2], mem[address+1], mem[address]};
   

    always @(posedge clk) begin
        if (WEM) begin
          {mem[address+3], mem[address+2], mem[address+1], mem[address]} = WriteData;
     
        end
    end

endmodule
