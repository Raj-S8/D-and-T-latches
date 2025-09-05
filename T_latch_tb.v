module t_latch_tb;
    reg clk, rst_n, t;
    wire q, q_bar;

    t_latch dut(.clk(clk), .rst_n(rst_n), .t(t), .q(q), .q_bar(q_bar));

    initial begin
        clk = 0;
        rst_n = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("At time = %0t, reset = %b, t = %b, q = %b, q_bar = %b", $time, rst_n, t, q, q_bar);
        #10 rst_n = 1;
        #10 t = 0;
        #10 t = 0;
        #10 t = 1;
        #10 t = 0;
        #10 t = 1;
        #10 t = 0;
        #10 t = 1;
        #10 t = 1;
        #10 t = 0;
        #10 t = 1;
        #10 rst_n = 0;
        #10 t = 0;
    end
    initial begin
        $dumpfile("t_latch_dump.vcd");
        $dumpvars(0,dut);
        #150 $finish;
    end
endmodule

