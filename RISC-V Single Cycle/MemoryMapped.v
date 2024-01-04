module memorymapped #(parameter Width = 32)(
    wire memWrite, clk,enable,ready_clr,
    wire [Width-1:0] address, WriteData,
    wire [Width-1:0] ReadData
);

    wire WEM,WE1;
    wire [1:0] RDSet;
    wire [Width-1:0] RData0;
    wire [Width-1:0] RData1;
wire [Width-1:0] out;
//uart--------------//



wire Tx_busy;
wire rdy;
wire [7:0] Rx_data;

wire loopback;

//----------------//
    Address_decoder uut(
        .address(address),
        .memWrite(memWrite), 
        .WEM(WEM), 
        .WE1(WE1), 
        .RDSet(RDSet)
    );

    mem my_memory(
        .clk(clk), 
        .WEM(WEM), 
        .address(address),
        .WriteData(WriteData),
        .RData0(RData0)
    ); 
   Memory_IO IO(
        .clk(clk), 
        .WE1(WE1), 
        .address(address),
        .WriteData(WriteData),
        .RData1(RData1)
);
    mux2_1 mux(
        .a(RData0),
        .b(RData1),
        .s(RDSet),
.out(out)
        
);
uart test_uart(.data_in(out[7:0]),
					.wr_en(enable),
					.clk_50m(clk),
					.Tx(loopback),
					.Tx_busy(Tx_busy),
					.Rx(loopback),
					.ready(ready),
					.ready_clr(ready_clr),
					.data_out(Rx_data)
					);


endmodule


