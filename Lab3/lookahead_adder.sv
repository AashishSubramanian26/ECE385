module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout, //same thing as C16 in experiment3.pdf diagram
    output PG, output GG
);

    logic [3:0] Pg, Gg; 
    logic C4, C8, C12;

    CLA UN1(.a(A[3 : 0]), .b(B[3 : 0]), .C0(0), .Sc(S[3 : 0]), .Cout1(cout), .P(Pg[0]), .G(Gg[0]));

    assign C4 = Gg[0] | cin & Pg[0]; 

    CLA UN2(.a(A[7 : 4]), .b(B[7 : 4]), .C0(C4), .Sc(S[7 : 4]), .Cout1(cout), .P(Pg[1]), .G(Gg[1]));

    assign C8 = Gg[1] | C4 & Pg[1]; 

    CLA UN3(.a(A[11 : 8]), .b(B[11 : 8]), .C0(C8), .Sc(S[11 : 8]), .Cout1(cout), .P(Pg[2]), .G(Gg[2]));

    assign C12  = Gg[2] | C8 & Pg[2];

    CLA UN4(.a(A[15 : 12]), .b(B[15 : 12]), .C0(C12), .Sc(S[15 : 12]), .Cout1(cout), .P(Pg[3]), .G(Gg[3]));

    assign cout = Gg[3] | C12 & Pg[3]; //Same as C16 in experiment3.pdf diagram

    assign PG <= Pg[0] & Pg[1] & Pg[2] & Pg[3]; 
    assign GG <= Gg[3] | (Gg[2] & Pg[3]) | (Gg[1] & Pg[3] & Pg[2]) | (Gg[0] & Pg[3] & Pg[2] & Pg[1]); 

    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */

endmodule


module CLA (
	input  [3:0] a,b,
	input         C0,
	output [3:0] Sc,
	output        Cout1,
    output P, output G
) (
    four_bit_ra FR1(.x(a[3 : 0]), .y(b[3 : 0]), .cin(C0), .s(S[3 : 0]), .cout(Cout1));

    assign P <= (a[0] ^ b[0]) & (a[1] ^ b[1]) & (a[2] ^ b[2]) & (a[3] ^ b[3]); 
    assign G <= (a[3] & b[3]) | ((a[2] & b[2]) & (a[3] ^ b[3])) | ((a[1] & b[1]) & (a[3] ^ b[3]) & (a[2] ^ b[2])) | ((a[0] & b[0]) & (a[3] ^ b[3]) & (a[2] ^ b[2]) & (a[1] ^ b[1])); 
);
    
endmodule
