module testbench();

    timeunit 10ns;
    timeprecision 1ns;
    
    logic [9:0] SW;
    logic	Clk, Run, Continue;
    logic [9:0] LED;
    logic [6:0] HEX0, HEX1, HEX2, HEX3;
    
    slc3_testtop dut(.*);
    
    initial begin
        Clk = 1'b0;
    end
    
    always begin
        #1 Clk = ~Clk;
    end
    
    initial begin
        Run = 1'b0;
        Continue = 1'b0;
    
        #2
        Run = 1'b1;
        Continue = 1'b1;
    
        #2
        Run = 1'b0;
        SW = 10'h0003;
    
        #2
        Run = 1'b1;
    end
    
    endmodule