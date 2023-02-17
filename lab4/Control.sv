//Two-always example for state machine

module control (input  logic Clk, Reset, Execute, M,
                output logic ClearXA, Shift_XAB, Add, Sub);

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    enum logic [5:0] {Start, Initialization, Shift1, Add1, Shift2, Add2, Shift3, Add3, Shift4, Add4, Shift5, 
                    Add5, Shift6, Add6, Shift7, Add7, Shift8, Subtract, Fin}   curr_state, next_state; 

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= Start;
        else 
            curr_state <= next_state;
    end

    // Assign outputs based on state
	always_comb
    begin
        
		next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 
            Start : if(Execute)
                        next_state = Initialization; 
            
            Initialization : next_state = Add1; 
            
            Add1 : next_state = Shift1; 
            Shift1: 
                begin
                next_state = Add2; 
                end

            Add2 : next_state = Shift2; 
            Shift2: 
                begin
                next_state = Add3; 
                end

            Add3 : next_state = Shift3; 
            Shift3: 
                begin
                next_state = Add4; 
                end

            Add4 : next_state = Shift4; 
            Shift4: 
                begin
                next_state = Add5; 
                end

            Add5 : next_state = Shift5; 
            Shift5: 
                begin
                next_state = Add6; 
                end

            Add6 : next_state = Shift6; 
            Shift6: 
                begin
                next_state = Add7; 
                end

            Add7 : next_state = Shift7; 
            Shift7: 
                begin
                next_state = Subtract; 
                end

            Subtract : next_state = Shift8;

            Shift8 : next_state = Fin; 


            Fin : if(~Execute)
                next_state = Start; 
            
            endcase
		  // Assign outputs based on ‘state’
		  
		  case (curr_state)
				Start:
				begin
					 Shift_XAB = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearXA = 1'b0;
					 
				end
				
				Initialization:
				begin
					 Shift_XAB = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearXA = 1'b1;
				end

				Add1, Add2, Add3, Add4, Add5, Add6, Add7:
				begin
				
					 Shift_XAB = 1'b0;
					 Add = M;
					 Sub = 1'b0;
					 ClearXA = 1'b0;
					  
				end
				
                Shift1, Shift2, Shift3, Shift4, Shift5, Shift6, Shift7, Shift8:
				begin
				
					 Shift_XAB = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearXA = 1'b0;
				end
				
				Subtract:
				begin
				
					 Shift_XAB = 1'b0;
					 Add = 1'b0;
					 Sub = M;
					 ClearXA = 1'b0;  
				end
				Fin:
				begin
					 Shift_XAB = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearXA = 1'b0;
				end
		  
		  
	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
		      begin 
               Shift_XAB = 1'b0;
					Add = 1'b0;
					Sub = 1'b0;
				   ClearXA = 1'b0;
		      end
        endcase
		 end
endmodule