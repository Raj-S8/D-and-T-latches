
module d_latch_tb;
    reg clk, rst_n, d;
    wire q,q_bar;

    d_latch dut(.clk(clk), .d(d), .rst_n(rst_n), .q(q), .q_bar(q_bar));

    initial
        begin
            clk = 0;
            d = 0;
            forever #5 clk = ~clk;
        end

    initial
        begin
            $monitor("At time: %0t, clk = %b, rst_n = %b, d = %b, q = %b, q_bar = %b", $time, clk, rst_n, d, q, q_bar);
            $dumpfile("D_latch.vcd");
            $dumpvars(0,dut);
            rst_n = 0;
            #10;
            rst_n = 1;
             #10 d = 0;
             #10 d = 1;
             #10 d = 1;
             #10 d = 0;
             #10 d = 1;
             #10;
             rst_n = 0;
        end
    initial
        begin
          #100 $finish;
        end

endmodule