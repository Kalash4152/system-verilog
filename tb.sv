// Testbench for AND gate (SystemVerilog)
module tb;
    logic a, b;   // inputs
    logic y;      // output

    // Instantiate the AND gate
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("and_gate.vcd");   // for GTKWave
        $dumpvars(0, tb);

        // Apply test values
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | a=%b b=%b | y=%b", $time, a, b, y);
    end
endmodule
