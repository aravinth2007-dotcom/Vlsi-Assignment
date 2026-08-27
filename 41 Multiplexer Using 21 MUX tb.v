`timescale 1ns/1ps
module tb_mux4to1;
    reg A, B, C, D;
    reg S1, S0;
    wire Y;
    mux4to1 dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .S1(S1),
        .S0(S0),
        .Y(Y)
    );
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mux4to1);

        $monitor("Time=%0t | A=%b B=%b C=%b D=%b | S=%b%b | Y=%b",
                 $time, A, B, C, D, S1, S0, Y);

        A=0; B=1; C=0; D=1;

        S1=0; S0=0;
        #10 
        S1=0; S0=1;
        #10 
        S1=1; S0=0;
        #10 
        S1=1; S0=1;

        #10 $finish;
    end
endmodule