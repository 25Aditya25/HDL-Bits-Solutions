/*
Written by Aditya Wani
Github: https://github.com/25Aditya25
Solution to Sequential Logic -> Finite State Machnes -> Simple_Fsm2_synchronous_reset
*/
module top_module(
    input clk,
    input reset,    // synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
        	OFF:
                if(j==1'b0)
                    begin
                    	next_state<=OFF;
                    end
            	else if(j==1'b1)
                	begin
                		next_state<=ON;
                	end
            ON:
                if(k==1'b0)
                    begin
                    	next_state<=ON;
                    end
            else if(k==1'b1)
                	begin
                		next_state<=OFF;
                	end
        endcase
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if(reset)
            begin
            	state<=OFF;
            end
        else
            begin
            	state<=next_state;
            end
    end

    // Output logic
    assign out = (state == ON)?1'b1:1'b0;

endmodule
