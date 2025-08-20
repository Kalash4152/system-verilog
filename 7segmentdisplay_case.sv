module sevenseg(
    input  logic [3:0] data,       // 4-bit input (0–9)
    output logic [6:0] seg         // renamed to 'seg' to avoid conflict
);

    always_comb
        case (data)
            0: seg = 7'b111_1110; // 0
            1: seg = 7'b011_0000; // 1
            2: seg = 7'b110_1101; // 2
            3: seg = 7'b111_1001; // 3
            4: seg = 7'b011_0011; // 4
            5: seg = 7'b101_1011; // 5
            6: seg = 7'b101_1111; // 6
            7: seg = 7'b111_0000; // 7
            8: seg = 7'b111_1111; // 8
            9: seg = 7'b111_0011; // 9
            default: seg = 7'b000_0000; // blank/off
        endcase

endmodule
