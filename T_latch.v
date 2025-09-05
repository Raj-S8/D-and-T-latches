module t_latch(
    input  clk, t, rst_n,
    output reg q,
    output q_bar
);

always @(clk or negedge rst_n) begin
    if (!rst_n)
        q <= 0;          // async reset
    else if (clk) begin  // latch transparent when clk=1
        if (t)
            q <= ~q;     // toggle
        // else implicit hold
    end
    // when clk=0, latch holds
end

assign q_bar = ~q;

endmodule
