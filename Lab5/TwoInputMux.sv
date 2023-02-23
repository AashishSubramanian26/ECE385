module TwoInputMux	(	input				S,
						input				[15:0] D1,
						input 				[15:0] D2,
						output logic		[15:0] Out_Mux);
						
		// 17 bit parallel multiplexer implemented using case statement
		always_comb
		begin
				unique case(S)
						1'b0	:	Out_Mux <= D1; //D1
						1'b1	:	Out_Mux <= D2; //Data_to_CPU
				endcase
		end
		
		
endmodule