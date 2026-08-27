`timescale 1ns/1ps

module tb_mux2to1;
    reg a, b, c;
    wire d;

    mux2to1 dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mux2to1);

        $monitor("Time=%0t | a=%b b=%b c=%b | d=%b",
                 $time, a, b, c, d);

        a=0; b=0; c=0;
        #10 
        a=0; b=1; c=0;
        #10 
        a=0; b=1; c=1;
        #10 
        a=1; b=0; c=0;
        #10 
        a=1; b=0; c=1;
        #10 
        a=1; b=1; c=0;
        #10 
        a=1; b=1; c=1;

        #10 $finish;
    end

endmodule