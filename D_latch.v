module d_latch(
    input clk,rst_n,
    input d,
    output reg q,
    output q_bar
);

    always@(clk)
        begin
            if(!rst_n)
                q <= 0;
            else
                if(clk)
                    q <= d;
        end
    assign q_bar = ~q;
endmodule


