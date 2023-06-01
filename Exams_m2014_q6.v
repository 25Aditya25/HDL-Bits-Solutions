/*
Written by Aditya Wani
Github: https://github.com/25Aditya25
Solution to Sequential Logic -> Finite State Machnes -> Exams/m2014 q6
*/
module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);

    parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4, F=3'd5, G=3'd6;
    
    reg [2:0] state,next_state;
    
    //Always block that tracks changes in inputs and decides next_state
    always@(*)
        begin
            case(state)
            	A:
                    if(w==1'b0) begin
                    	next_state<=B;
                    end
                    else if(w==1'b1) begin
						next_state<=A;
                    end
                B:
                    if(w==1'b0) begin
                    	next_state<=C;
                    end
                    else if(w==1'b1) begin
						next_state<=D;
                    end
                C:
                    if(w==1'b0) begin
                    	next_state<=E;
                    end
                    else if(w==1'b1) begin
						next_state<=D;
                    end
                D:
                    if(w==1'b0) begin
                    	next_state<=F;
                    end
                    else if(w==1'b1) begin
						next_state<=A;
                    end
                E:
                    if(w==1'b0) begin
                    	next_state<=E;
                    end
                    else if(w==1'b1) begin
						next_state<=D;
                    end
                F:
                    if(w==1'b0) begin
                    	next_state<=C;
                    end
                    else if(w==1'b1) begin
						next_state<=D;
                    end
            endcase
        end
    
    //Always Block to change state 
    always@(posedge clk)
        begin
            if(reset==1'b1)
                begin
                	state<=A;
                end
            else
                begin
                	state<=next_state;
                end
        end
    
    //Output Assignment
    assign z=(state==E || state==F)?1'b1:1'b0;
endmodule
