`timescale  10ns/1ns

module memorymappedtb();
reg clk = 0;
reg enable = 0;
reg reset=0;
reg ready_clr = 0;
// DUT instantiation
memorymapped dut (.clk(clk), .reset(reset),.enable(enable),.ready_clr(ready_clr));
initial begin
	  $monitor("time: %d", $time," pc = %d r1 = %d, r4 = %d, r10 = %d, ram[6] = %d, zeroflag=%d",
            dut.pc_out, dut.reg_file.reg_file[1], dut.reg_file.reg_file[4],
            dut.reg_file.reg_file [10], dut.ram.ram[6],dut.zero);
	enable <= 1'b1;
	#2 enable <= 1'b0;
end
initial
begin
    clk = 0;
    reset = 1;
    #2
    reset = 0;
end

// clock signal generation
always
    #5 clk = ~clk;



endmodule