`timescale 1ns/1ps

module tb_mux2;
  logic [3:0] d0, d1;
  logic s;
  logic [3:0] y;

  // Instantiate mux
  mux2 uut (
    .d0(d0), .d1(d1), .s(s), .y(y)
  );

  initial begin
    $dumpfile("mux2.vcd");   // for waveform
    $dumpvars(0, tb_mux2);

    // Test case 1
    d0 = 4'b0001; d1 = 4'b1110; s = 0;
    #10;  // wait 10ns
    $display("s=%b d0=%b d1=%b y=%b", s, d0, d1, y);

    // Test case 2
    s = 1;
    #10;
    $display("s=%b d0=%b d1=%b y=%b", s, d0, d1, y);

    // Test case 3
    d0 = 4'b1010; d1 = 4'b0101; s = 0;
    #10;
    $display("s=%b d0=%b d1=%b y=%b", s, d0, d1, y);

    $finish;
  end
endmodule
