//Two-always example for state machine

module control (input  logic Clk, Reset, CLR_LDB, Execute,
                output logic ClearXA_loadB, Shift_XAB, Add, Sub, M);

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    enum logic [3:0] {Start, Initialization, Shift1, Add1, Shift2, Add2, Shift3, Add3, Shift4, Add4, Shift5, 
                    Add5, Shift6, Add6, Shift7, Add7, Shift8, Sub, Fin}   curr_state, next_state; 

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
            
            Initialization : if(M) next_state = Add1; 
                            else next_state = Shift1; 
            
            Add1 : next_state = Shift1; 
            Shift1: if(M) next_state = Add2; 
                else next_state = Shift2;

            Add2 : next_state = Shift2; 
            Shift2: if(M) next_state = Add3; 
                else next_state = Shift3;

            Add3 : next_state = Shift3; 
            Shift3: if(M) next_state = Add4; 
                else next_state = Shift4;

            Add4 : next_state = Shift4; 
            Shift4: if(M) next_state = Add5; 
                else next_state = Shift5;

            Add5 : next_state = Shift5; 
            Shift5: if(M) next_state = Add6; 
                else next_state = Shift6;

            Add6 : next_state = Shift6; 
            Shift6: if(M) next_state = Add7; 
                else next_state = Shift7;

            Add7 : next_state = Shift7; 
            Shift7: if(M) next_state = Sub; 
                else next_state = Shift8;

            Shift8 : next_state = Fin; 

            Fin : if(~Execute)
                next_state = Start; 
            
            default: Start; 


		  // Assign outputs based on ‘state’
		  
		  case (curr_state)
				Start:
				begin
					 Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					 
				end
				
				Initialization:
				begin
				
					 Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b1;

				end
				
				Add1:
				begin
				
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Shift1:
				begin
				
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Add2:
				begin
				
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Shift2:
				begin
				
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Add3:
				begin
				
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Shift3:
				begin
				
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Add4:
				begin
				
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Shift4:
				begin
				
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Add5:
				begin
				
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Shift5:
				begin
				
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Add6:
				begin
				
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Shift6:
				begin
				
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Add7:
				begin
				
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Shift7:
				begin
				
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Sub:
				begin
				
					 Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b1;
					 ClearA_LoadB = 1'b0;
					  
				end
				
				Shift8:
				begin
				
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
					  
				end	
				
				Fin:
				begin
					 Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
					 ClearA_LoadB = 1'b0;
				end
		  
		  
	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
		      begin 
               Shift = 1'b;
					Add = 1'b;
					Sub = 1'b;
				   ClearA_LoadB = 1'b;
		      end
        endcase
endmodule