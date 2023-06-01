/*
Written by Aditya Wani
Github: https://github.com/25Aditya25
Solution to Sequential Logic -> Finite State Machnes -> Fsm3comb
*/
module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;
    
    
    // State transition logic: next_state = f(state, in)
    always@(in)
        begin
            case(state)
            	A:
                    if(in==1'b0)
                        begin
                        	next_state<=A;
                        end
                    else if(in==1'b1)
                        begin
                            next_state<=B;
                        end
                B:
                    if(in==1'b0)
                        begin
                        	next_state<=C;
                        end
                    else if(in==1'b1)
                        begin
                            next_state<=B;
                        end
                C:
                    if(in==1'b0)
                        begin
                        	next_state<=A;
                        end
                    else if(in==1'b1)
                        begin
                            next_state<=D;
                        end
                D:
                    if(in==1'b0)
                        begin
                        	next_state<=C;
                        end
                    else if(in==1'b1)
                        begin
                            next_state<=B;
                        end
            endcase
        end
    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state==D)?1'b1:1'b0;
endmodule
