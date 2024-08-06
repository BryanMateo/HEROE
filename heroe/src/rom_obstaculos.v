module rom_obstaculos (
    input [4:0] tipo_obs,
    output reg [6:0] obstaculo
);
  always @(*) begin
    case (tipo_obs)
      5'd0: obstaculo = 7'b1100011;
      5'd1: obstaculo = 7'b1011100;
      5'd2: obstaculo = 7'b0001001;
      5'd3: obstaculo = 7'b0011000;
      5'd4: obstaculo = 7'b0100001;
      5'd5: obstaculo = 7'b0100000;
      5'd6: obstaculo = 7'b1000000;
      5'd7: obstaculo = 7'b0001000;
      5'd8: obstaculo = 7'b1010000;
      5'd9: obstaculo = 7'b1100000;
      5'd10: obstaculo = 7'b1100000;
      5'd11: obstaculo = 7'b1010000;
      5'd12: obstaculo = 7'b0001000;
      5'd13: obstaculo = 7'b0100000;
      5'd14: obstaculo = 7'b0100001;
      5'd15: obstaculo = 7'b1011100;
      5'd16: obstaculo = 7'b1111111;  //bono
      default: obstaculo = 7'b0000000;
    endcase
  end
endmodule
