//4-bit logic processor top level module


//Always use input/output logic types when possible, prevents issues with tools that have strict type enforcement

module Processor (input logic   Clk,     // Internal
                                Reset_ClearA_LoadB,   // Push button 0
                                Execute,  // Push Button 1

						input  logic [7:0] S, //Input data 
						
                  output logic [6:0]  HEX1, HEX0, HEX3, HEX2,

                  output logic [7:0] Aval, Bval
                                );

                                

	 //local logic variables go here

   logic Reset_H, Run_H;

    logic ClearXA, Shift_XAB;	 
	 logic shift, add, sub;

	 logic [7:0] A, B;
	 logic [8:0] Sum;

    assign Aval = A;
    assign Bval = B;

    logic A_Output; 
    logic B_Output; 
	 
	 logic X, M;
	 	 
	 assign M = B[0];

    always_ff @ (posedge Clk) begin
      Reset_H <= ~Reset_ClearA_LoadB;
      Run_H <= ~Execute;
    end

    always_ff @ (posedge Clk) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
    begin
	 	 if (Reset_H | ClearXA) 
         X <= 0;
		 else if (add | sub)
         X <= Sum[8];
    end
	  
	 //Instantiation of modules here

	 register_unit    reg_unit (
                        .Clk(Clk),
                        .Reset(Reset_H),
                        .ClearXA(ClearXA),
                        .Ld_A(add | sub), //note these are inferred assignments, because of the existence a logic variable of the same name
                        .Ld_B(),
                        .Shift_En(Shift_XAB),
                        .D_A(Sum[7:0]), 
                        .D_B(S), 
                        .A_In(X),
                        .B_In(A_Output),
                        .A_out(A_Output),
                        .B_out(B_Output),
                        .A(A),
                        .B(B));

	 control          control_unit (
                        .Clk(Clk),
                        .Reset(Reset_H),
                        .ClearXA(ClearXA),
                        .Execute(Run_H),
                        .Shift_XAB(Shift_XAB),
                        .Add(add), 
                        .Sub(sub),
                        .M(M));
    ADD_SUB9         Add_Shit (
                        .A(A), 
                        .B(S), 
                        .fn(sub), 
                        .S(Sum)
                     ); 
	 HexDriver        HexAL (
                        .In0(A[3:0]),
                        .Out0(HEX2) );
	 HexDriver        HexBL (
                        .In0(B[3:0]),
                        .Out0(HEX0) );
								
	 //When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
	 HexDriver        HexAU (
                        .In0(A[7:4]),
                        .Out0(HEX3) );	
	 HexDriver        HexBU (
                       .In0(B[7:4]),
                        .Out0(HEX1) );
								
   	//assign LED[1:0] = X;
	  //Input synchronizers required for asynchronous inputs (in this case, from the switches)
	  //These are array module instantiations
	  //Note: S stands for SYNCHRONIZED, H stands for active HIGH
	  //Note: We can invert the levels inside the port assignments
	//   sync button_sync[3:0] (Clk, {~Reset, LoadA, LoadB, ~Execute}, {Reset_SH, LoadA_SH, LoadB_SH, Execute_SH});
	//   sync Din_sync[7:0] (Clk, Din, Din_S); //changed to 8 bits
	//   sync F_sync[2:0] (Clk, F, F_S);
	//   sync R_sync[1:0] (Clk, R, R_S);
	  
endmodule
