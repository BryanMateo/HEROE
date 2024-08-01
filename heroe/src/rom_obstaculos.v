module rom_obstaculos (
    input [3:0] tipo_obs,
    output reg [6:0] obstaculo
);
    always @(*) begin
        case (tipo_obs)
            4'd0: obstaculo = 7'b1100011;
            4'd1: obstaculo = 7'b1100010;
            4'd2: obstaculo = 7'b1001000;
            4'd3: obstaculo = 7'b0001100;
            4'd4: obstaculo = 7'b1000010;
            4'd5: obstaculo = 7'b0000011;
            4'd6: obstaculo = 7'b0000001;
            4'd7: obstaculo = 7'b0001000;
            4'd8: obstaculo = 7'b0000101;
            4'd9: obstaculo = 7'b0000011;
            default: obstaculo = 7'b0000000;
        endcase
    end
endmodule