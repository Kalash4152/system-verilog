module tb_case;
    logic [3:0] data;
    logic [6:0] seg;   // match with DUT port name

    // Instantiate the design
    sevenseg uut (.data(data), .seg(seg));

    initial begin
        $dumpfile("case.vcd");   // waveform file
        $dumpvars(0, tb_case);

        // Apply values 0–9
        for (int i = 0; i < 10; i++) begin
            data = i;
            #10;  // wait 10 time units
            $display("Time=%0t | data=%0d | seg=%b", $time, data, seg);
        end

        $finish;
    end
endmodule

