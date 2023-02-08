module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */

    logic C4, C8, C12; 

    four_bit_ra FR_CSA(.x(a[3 : 0]), .y(b[3 : 0]), .cin(cin), .s(S[3 : 0]), .cout(C4)); //the input cin in ".cin(cin)" is the input to select adder

    CSA_unit UNITA(.a(A[7 : 4]), .b(B[7 : 4]), .cin_CSA(C4), .S_CSA(S[7 : 4]), .Cout_CSA(C8));

    CSA_unit UNITA(.a(A[11 : 8]), .b(B[11 : 8]), .cin_CSA(C8), .S_CSA(S[11 : 8]), .Cout_CSA(C12));

    CSA_unit UNITA(.a(A[15 : 12]), .b(B[15 : 12]), .cin_CSA(C15), .S_CSA(S[15 : 12]), .Cout_CSA(cout));    


endmodule

module CSA_unit (
	input  [3:0] a, b,
    input cin_CSA, 
	output [3:0] S_CSA, 
	output        Cout_CSA
);

    logic [3:0] S_ALT
    logic Cout1, Cout2; 

    four_bit_ra FR1(.x(a[3 : 0]), .y(b[3 : 0]), .cin(0), .s(S_CSA[3 : 0]), .cout(Cout1));
    four_bit_ra FR1(.x(a[3 : 0]), .y(b[3 : 0]), .cin(1), .s(S_ALT[3 : 0]), .cout(Cout2));

    always_comb
    begin
        case (cin_CSA == 1'b1)
			S_CSA = S_ALT;
        endcase 
    end

    assign Cout_CSA = (cin_CSA & Cout2) | Cout1; 

endmodule
