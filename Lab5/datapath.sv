module datapath (	
                    input logic  LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED, Clk, Reset, Run, Continue;
                    input logic  GatePC, GateMDR, GateALU, GateMARMUX;
                    input logic  SR2MUX, ADDR1MUX, MARMUX;
                    input logic  BEN, MIO_EN, DRMUX, SR1MUX;
                    input logic  [1:0] PCMUX, ADDR2MUX, ALUK;
                    input logic  [15:0] MDR_In;
					output logic [15:0]	logic [15:0] MAR, MDR, IR; //outputs
				);
				

	logic 	[15:0] 	BUS,
					SR1OUT,
					SR2OUT,
					IR_out_wire,
					MDR_out_wire,
					MAR_out_wire, 
					PC_out_wire, 
					mdrmux_out,
					sr2mux_out,
					addr1mux_out, 
					pcmux_out, 
					drmux_out,
					addr2mux_out,
					reg_file_sr1_in,
					ALU_out;

	logic 			BEN_out_wire;

	3InputMux pcmux(
						.sel(PCMUX), 
						.d0(PC_out_wire + 1'b1), 
						.d1(BUS), 
						.d2(addr2mux_out + addr1mux_out), 
						.d3(), 
						.out(pcmux_out)
						);

	/*
		0	: 	GateMARMUX
		1	: 	GatePC
		2	: 	GateALU
		3	: 	GateMDR
	*/
	tristate_mux41 tristategate(
								.sel({GateMDR, GateALU, GatePC, GateMARMUX}), 
								.d0(addr2mux_out + addr1mux_out), 
								.d1(PC_out_wire), 
								.d2(ALU_out), 
								.d3(MDR_out_wire), 
								.out(BUS)
								);

	REGFILE reg_file(
					.CLK(Clk),
					.LDREG(LD_REG),
					.Reset(Reset),
					.bus(BUS), 
					.DR(drmux_out),
					.SR1(reg_file_sr1_in),
					.SR2(IR_out_wire[2:0]),
					.SR1_OUT(SR1OUT),
					.SR2_OUT(SR2OUT)
					);

	reg_16bit  IR(
				.clk(Clk),
				.reset(Reset),	
				.load(LD_IR), 
				.din(BUS), 
				.dout(IR_out_wire)
				);

	reg_16bit  MDR(
				.clk(Clk),
				.reset(Reset), 
				.load(LD_MDR), 
				.din(mdrmux_out), 
				.dout(MDR_out_wire)
				);

	reg_16bit  PC(
				.clk(Clk),
				.reset(Reset),	 
				.load(LD_PC), 
				.din(pcmux_out), 
				.dout(PC_out_wire)
				);

	always_comb begin
		MDR_out = MDR_out_wire;
		MAR_out = MAR_out_wire;
		IR_out = IR_out_wire;
		PC_out = PC_out_wire;
		BEN = BEN_out_wire;
	end 

	always_ff @ (posedge Clk) begin
		if (LD_LED)
			LED <= IR_out[11:0];
		else
			LED <= 12'b0;
	end
endmodule 