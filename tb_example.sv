`timescale 1ns/1ps

module tb_example;
    logic a, b, c;
    logic y;

    // Instantiate the design under test (DUT)
    example dut (
        .a(a), .b(b), .c(c), .y(y)
    );

    initial begin
        $dumpfile("example.vcd");   // waveform dump file
        $dumpvars(0, tb_example);   // dump all variables

        // Apply test values
        a = 0; b = 0; c = 0;
        #10;
        a = 1; b = 0; c = 1;
        #10;
        a = 1; b = 1; c = 0;
        #10;
        a = 1; b = 1; c = 1;
        #10;

        $finish;
    end
endmodule
