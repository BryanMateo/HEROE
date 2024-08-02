module rom_obstaculos (
    input [3:0] tipo_obs,
    output reg [6:0] obstaculo
);
  always @(*) begin
    case (tipo_obs)
      4'd0: obstaculo = 7'b1100011;
      4'd1: obstaculo = 7'b0100011;
      4'd2: obstaculo = 7'b0001001;
      4'd3: obstaculo = 7'b0011000;
      4'd4: obstaculo = 7'b0100001;
      4'd5: obstaculo = 7'b1100000;
      4'd6: obstaculo = 7'b1000000;
      4'd7: obstaculo = 7'b0001000;
      4'd8: obstaculo = 7'b1010000;
      4'd9: obstaculo = 7'b1100000;
      4'd10: obstaculo = 7'b0011000;
      4'd11: obstaculo = 7'b0100001;
      4'd12: obstaculo = 7'b1100000;
      4'd13: obstaculo = 7'b1000000;
      4'd14: obstaculo = 7'b0001000;
      4'd15: obstaculo = 7'b1010000;
      default: obstaculo = 7'b0000000;
    endcase
  end
endmodule
