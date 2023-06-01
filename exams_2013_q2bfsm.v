/*
Written by Aditya Wani
Github: https://github.com/25Aditya25
Solution to Sequential Logic -> Finite State Machnes -> exams_2013_q2bfsm
*/
module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 

    reg [3:0] state, next_state;
    
    parameter s0=4'd0, s1=4'd1, s2=4'd2, s3=4'd3, s4=4'd4, s5=4'd5, s6=4'd6, s7=4'd7, s8=4'd8;
    
    //Always Block for assigning next_state depending on input change and reset
    always@(*)
        begin
            case(state)
            	s0:
                    if(resetn==1'b0) begin
                        next_state<=s0;
                    end
               		else if(resetn==1'b1) begin
                    	next_state<=s8;
                    end
                s1:
                    if(x==1'b0) begin
                        next_state<=s1;
                    end
                	else if(x==1'b1) begin
                    	next_state<=s2;
                    end
                s2:
                    if(x==1'b0) begin
                        next_state<=s3;
                    end
               	 	else if(x==1'b1) begin
                    	next_state<=s2;
                    end
                s3:
                    if(x==1'b0) begin
                        next_state<=s1;
                    end
                	else if(x==1'b1) begin
                    	next_state<=s4;
                    end
                s4:
                    if(y==1'b0) begin
                        next_state<=s5;
                    end
                	else if(y==1'b1) begin
                    	next_state<=s6;
                    end
                s5:
                    if(y==1'b0) begin
                        next_state<=s7;
                    end
                	else if(y==1'b1) begin
                    	next_state<=s6;
                    end
                s6:
                    if(resetn==1'b0) begin
                        next_state<=s0;
                    end
                	else begin
                    	next_state<=s6;
                    end
                s7:
                    if(resetn==1'b0) begin
                        next_state<=s0;
                    end
                	else begin
                    	next_state<=s7;
                    end
                s8:
                    next_state<=s1;
                
            endcase
        end
    
    //Awlays Block to change state variable
    always@(posedge clk)
        begin
            if(resetn==1'b0) begin
                state<=s0;
            end
            else if(resetn==1'b1) begin
                state<=next_state;
            end
        	
        end
    
    //Output assignments
    assign f=(state==s8)?1'b1:1'b0;
    assign g=(state==s4 || state==s5 || state==s6)?1'b1:1'b0;
endmodule
