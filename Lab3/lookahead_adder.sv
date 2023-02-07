module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);



    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */

endmodule


module CLA #(
	input  [3:0] a,b,
	input         C0,
	output [3:0] S,
	output        Cout,
    output P, output G
) (
    four_bit_ra FR1(.x(A[3 : 0]), .y(B[3 : 0]), .cin(C0), .s(S[3 : 0]), .cout(Cout));

    assign P <= a[0] ^ b[0]; 
    assign G <= a[0] & b[0]; 
);
    
endmodule
