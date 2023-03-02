module TwoInputMux	#(parameter width = 16) (	input				S,
						input				[width - 1:0] D1,
						input 				[width - 1:0] D2,
						output logic		[width - 1:0] Out_Mux);
						
		always_comb
		begin
				unique case(S)
						1'b0	:	Out_Mux <= D1; 
						1'b1	:	Out_Mux <= D2; 
				endcase
		end
		
		
endmodule
