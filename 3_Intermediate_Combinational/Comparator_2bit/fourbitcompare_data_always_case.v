module fourbitcompare_data_always_case(input [1:0]a,input [1:0]b,output reg g,e,l);
always @(*) begin
    case({a,b})

        4'b0000: begin g=0; e=1; l=0; end
        4'b0001: begin g=0; e=0; l=1; end
        4'b0010: begin g=0; e=0; l=1; end
        4'b0011: begin g=0; e=0; l=1; end

        4'b0100: begin g=1; e=0; l=0; end
        4'b0101: begin g=0; e=1; l=0; end
        4'b0110: begin g=0; e=0; l=1; end
        4'b0111: begin g=0; e=0; l=1; end

        4'b1000: begin g=1; e=0; l=0; end
        4'b1001: begin g=1; e=0; l=0; end
        4'b1010: begin g=0; e=1; l=0; end
        4'b1011: begin g=0; e=0; l=1; end

        4'b1100: begin g=1; e=0; l=0; end
        4'b1101: begin g=1; e=0; l=0; end
        4'b1110: begin g=1; e=0; l=0; end
        4'b1111: begin g=0; e=1; l=0; end

        default: begin g=0; e=0; l=0; end

    endcase
end

endmodule
