`timescale 1ns/1ps
module tb_moore_counter;
    reg clk, reset;
    wire [1:0] count;

    // Instantiate DUT
    moore_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generator
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Stimulus
    initial begin
        $dumpfile("moore_counter.vcd");
        $dumpvars(0, tb_moore_counter);

        reset = 1;
        #10 reset = 0;

        #100; // Run simulation for 100ns
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | reset=%b | state_out=%b", $time, reset, count);
    end
endmodule
