/*
Written by Aditya Wani
Github: https://github.com/25Aditya25
Solution to Sequential Logic -> Finite State Machnes -> Simple_Fsm1_asynchronous_reset
*/
module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
            A: if(in==1'b1)
                begin
                	next_state<=A;
                end
            else if(in==1'b0)
                begin
                	next_state<=B;
                end
            B: if(in==1'b1)
                begin
                	next_state<=B;
                end
            else if(in==1'b0)
                begin
                	next_state<=A;
                end
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset)
            begin
            	state <= B;
            end
        else 
            begin
        		state <= next_state;
        	end
    end
	
    
    // Output logic
    assign out = (state == A)?1'b0:1'b1;

endmodule
