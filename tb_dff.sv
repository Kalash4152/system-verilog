`timescale 1ns/1ps

module tb_dff;

    logic d;
    logic clk;
    logic q;

    // Instantiate D Flip-Flop
    dff uut (
        .d(d),
        .clk(clk),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10 ns period clock
    end

    // Stimulus
    initial begin
        d = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #20 d = 0;
        #20 $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | clk=%b | d=%b | q=%b", $time, clk, d, q);
    end

endmodule
