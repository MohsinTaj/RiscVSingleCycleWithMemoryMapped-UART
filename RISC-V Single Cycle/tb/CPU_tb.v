module cpu_tb;
    // signal declaration
    reg clk = 0, reset = 1, enable = 0, ready_clr = 0;

    // DUT instantiation
    cpu dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .ready_clr(ready_clr)
    );

    // body
    initial begin
        $monitor("time: %d", $time, " pc = %d r1 = %d, r4 = %d, r10 = %d, ram[6] = %d, zeroflag=%d",
                dut.pc_out, dut.reg_file.reg_file[1], dut.reg_file.reg_file[4],
                dut.reg_file.reg_file[10], dut.ram.ram[6], dut.zero);
    end

    // clock signal generation
    always #5 clk = ~clk;

    // reset sequence
    initial begin
        #2 reset = 0;
        #7 enable = 1;
        #10 ready_clr = 1;
        #10 ready_clr = 0;
    end

    // dump to file
    initial begin
        $dumpfile("riscv_cpu.vcd");
        $dumpvars(0, cpu_tb);
    end
endmodule

