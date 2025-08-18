`timescale 1ns/1ps

module example(
    input  logic a, b, c,
    output logic y
);
    logic ab, bb, cb, n1, n2, n3;

    // Invert inputs after 1 time unit delay
    assign #1 {ab, bb, cb} = ~{a, b, c};

    // Some logic expressions with 2 time unit delay
    assign #2 n1 = ab & bb & cb;
    assign #2 n2 = a & bb & cb;
    assign #2 n3 = a & bb & c;

    // Output y after 4 time unit delay
    assign #4 y = n1 | n2 | n3;
endmodule
