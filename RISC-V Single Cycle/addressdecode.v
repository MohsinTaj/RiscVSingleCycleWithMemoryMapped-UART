module Address_decoder #(parameter Width = 32)(
    input [Width-1:0] address,
    input memWrite,
    output reg WEM, WE1,
    output reg [1:0] RDSet
);

    always @* begin
        if (memWrite) begin
            if (address == 32'd31) begin
                  WEM = 1'b1;
                WE1 = 1'b0;
                RDSet = 2'b00;
            end else begin
             
               WEM = 1'b0;
                WE1 = 1'b1;
                RDSet = 2'b01;
            end
        end else begin
            WEM = 1'b0;
            WE1 = 1'b0;
            RDSet = 2'b00;
        end
    end
endmodule

