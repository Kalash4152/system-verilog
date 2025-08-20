module moore_counter (
    input clk,
    input reset,
    output reg [1:0] count
);
    // State encoding
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] state, next_state;

    // Sequential block
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case(state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore: depends only on state)
    always @(*) begin
        case(state)
            S0: count = 2'b00;
            S1: count = 2'b01;
            S2: count = 2'b10;
            S3: count = 2'b11;
            default: count = 2'b00;
        endcase
    end
endmodule

