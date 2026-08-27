`timescale 1ns/1ps

module tb_comparator4bit;

    reg [3:0] A, B;
    wire A_gt_B, A_eq_B, A_lt_B;

    comparator4bit dut(
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B)
    );

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, tb_comparator4bit);

        $monitor("Time=%0t | A=%b B=%b | A>B=%b A=B=%b A<B=%b",
                 $time, A, B, A_gt_B, A_eq_B, A_lt_B);

        A=4'b0101; B=4'b0101; #10;
        A=4'b1001; B=4'b0101; #10;
        A=4'b0011; B=4'b1010; #10;
        A=4'b1111; B=4'b0000; #10;
        A=4'b0000; B=4'b1111; #10;

        $finish;
    end

endmodule