`timescale 1ns/1ps

module tb_half_sub;

    reg A, B;
    wire Dif, Bor;

    half_sub dut (
        .A(A),
        .B(B),
        .Dif(Dif),
        .Bor(Bor)
    );
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_half_sub);

        $monitor("Time=%0t | A=%b B=%b | Diff=%b Borrow=%b",
                 $time, A, B, Dif, Bor);

        A=0; B=0;
        #10 
        A=0; B=1;
        #10 
        A=1; B=0;
        #10 
        A=1; B=1;
        #10
         $finish;
    end
endmodule