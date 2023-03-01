module REGFILE(
				input logic 	Clk, LD_REG, Reset,
				input logic		[15:0] 	BUS,
				input logic 	[2:0]	DR, SR1, SR2,
				output logic 	[15:0]	SR1OUT, SR2OUT
				);

	logic [7:0] registers [15:0];

	always_ff @ (posedge Clk) begin
		if(Reset) begin
            registers[7:0] <= 16'h0000; 
			//  registers[0] 	<=	16'h0000;
			//  registers[1] 	<=	16'h0000;
			//  registers[2] 	<=	16'h0000;
			//  registers[3] 	<=	16'h0000;
			//  registers[4] 	<=	16'h0000;
			//  registers[5] 	<=	16'h0000;
			//  registers[6] 	<=	16'h0000;
			//  registers[7] 	<=	16'h0000;
		end
		else if(LD_REG) begin
			case (DR)
				3'b000	:	registers[0] <= BUS;
				3'b001	:	registers[1] <= BUS;
				3'b010	:	registers[2] <= BUS;
				3'b011	:	registers[3] <= BUS;
				3'b100	:	registers[4] <= BUS;
				3'b101	:	registers[5] <= BUS;
				3'b110	:	registers[6] <= BUS;
				3'b111	:	registers[7] <= BUS;
				default: ;
			endcase
		end
	end

	always_comb begin
		case (SR1)
			3'b000	:	SR1OUT = registers[0];
			3'b001	:	SR1OUT = registers[1];
			3'b010	:	SR1OUT = registers[2];
			3'b011	:	SR1OUT = registers[3];
			3'b100	:	SR1OUT = registers[4];
			3'b101	:	SR1OUT = registers[5];
			3'b110	:	SR1OUT = registers[6];
			3'b111	:	SR1OUT = registers[7];
			default: ;
		endcase

		case (SR2)
			3'b000	:	SR2OUT = registers[0];
			3'b001	:	SR2OUT = registers[1];
			3'b010	:	SR2OUT = registers[2];
			3'b011	:	SR2OUT = registers[3];
			3'b100	:	SR2OUT = registers[4];
			3'b101	:	SR2OUT = registers[5];
			3'b110	:	SR2OUT = registers[6];
			3'b111	:	SR2OUT = registers[7];
			default: ;
		endcase
	end
endmodule