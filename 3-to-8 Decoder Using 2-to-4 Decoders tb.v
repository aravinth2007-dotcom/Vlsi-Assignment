`timescale 1ns/1ps

module tb_decoder3to8;

    reg [2:0] A;
    reg Enable;
    wire [7:0] Y;

    decoder3to8 dut(
        .A(A),
        .Enable(Enable),
        .Y(Y)
    );

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, tb_decoder3to8);

        $monitor("Time=%0t | Enable=%b | A=%b | Y=%b",
                 $time, Enable, A, Y);

        Enable=1;

        A=3'b000; #10;
        A=3'b001; #10;
        A=3'b010; #10;
        A=3'b011; #10;
        A=3'b100; #10;
        A=3'b101; #10;
        A=3'b110; #10;
        A=3'b111; #10;

        Enable=0; #10;

        $finish;
    end

endmodule