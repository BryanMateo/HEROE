module rom_heroe (
    input [2:0] tipo_h,
    input [1:0] var_h,
    output reg [6:0] heroe
);
  //abcdefg
  parameter U = 7'b0111110;
  parameter I = 7'b0110000;
  parameter P = 7'b1100111;
  parameter F = 7'b1000111;
  parameter E = 7'b1001111;
  parameter volar = 7'b1000000;
  parameter saltar = 7'b0000001;
  parameter agacharse = 7'b0001000;

  always @(*) begin
    case (var_h)
      2'd0: begin
        case (tipo_h)
          3'd0: heroe = U;
          3'd1: heroe = I;
          3'd2: heroe = P;
          3'd3: heroe = F;
          3'd4: heroe = E;
          default: heroe = 7'd0;
        endcase
      end
      2'd1: heroe = saltar;
      2'd2: heroe = volar;
      2'd3: heroe = agacharse;
    endcase
  end
endmodule
