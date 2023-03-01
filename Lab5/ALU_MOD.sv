module ALU_MOD(
			input logic 	[15:0]	A, B, 
			input logic 	[1:0]	ALUK,
			output logic 	[15:0] 	ALUOut
		   );

	always_comb begin
		case(ALUK) 
			2'b00	:	ALUOut = A + B;
			2'b01	:	ALUOut = A & B;
			2'b10	:	ALUOut = ~A;
			2'b11	:	ALUOut = A;
		endcase
	end 
endmodule 