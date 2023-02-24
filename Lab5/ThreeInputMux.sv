module ThreeInputMux	(	input				[1:0] S,
							input				[15:0] D1,
							input               [15:0] D2,
							input 				[15:0] D3,
							output logic		[15:0] OUT);
	
		always_comb
		begin
		unique case(S)
			2'b00	:	OUT <= D1; 
			2'b01	:	OUT <= D2;
			2'b10   :   OUT <= D3;
		endcase
		end


endmodule