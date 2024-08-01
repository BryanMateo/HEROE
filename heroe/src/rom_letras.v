module rom_letras (
    input [4:0] letra,
    output reg [6:0] letra_out
);
  parameter A = 7'd119;
  parameter B = 7'd124;
  parameter C = 7'd57;
  parameter D = 7'd94;
  parameter E = 7'd121;
  parameter F = 7'd113;
  parameter G = 7'd111;
  parameter H = 7'd118;
  parameter I = 7'd25;
  parameter J = 7'd30;
  parameter K = 7'd122;
  parameter L = 7'd56;
  parameter M = 7'd55;
  parameter N = 7'd84;
  parameter O = 7'd63;
  parameter P = 7'd115;
  parameter Q = 7'd103;
  parameter R = 7'd80;
  parameter S = 7'd109;
  parameter T = 7'd120;
  parameter U = 7'd28;
  parameter V = 7'd62;
  parameter W = 7'd29;
  parameter X = 7'd112;
  parameter Y = 7'd110;
  parameter Z = 7'd73;

  always @(*) begin
    case (letra)
      5'd0: letra_out = A;  // Caso 0 (A)
      5'd1: letra_out = B;  // Caso 1 (B)
      5'd2: letra_out = C;  // Caso 2 (C)
      5'd3: letra_out = D;  // Caso 3 (D)
      5'd4: letra_out = E;  // Caso 4 (E)
      5'd5: letra_out = F;  // Caso 5 (F)
      5'd6: letra_out = G;  // Caso 6 (G)
      5'd7: letra_out = H;  // Caso 7 (H)
      5'd8: letra_out = I;  // Caso 8 (I)
      5'd9: letra_out = J;  // Caso 9 (J)
      5'd10: letra_out = K;  // Caso 10 (K)
      5'd11: letra_out = L;  // Caso 11 (L)
      5'd12: letra_out = M;  // Caso 12 (M)
      5'd13: letra_out = N;  // Caso 13 (N)
      5'd14: letra_out = O;  // Caso 14 (O)
      5'd15: letra_out = P;  // Caso 15 (P)
      5'd16: letra_out = Q;  // Caso 16 (Q)
      5'd17: letra_out = R;  // Caso 17 (R)
      5'd18: letra_out = S;  // Caso 18 (S)
      5'd19: letra_out = T;  // Caso 19 (T)
      5'd20: letra_out = U;  // Caso 20 (U)
      5'd21: letra_out = V;  // Caso 21 (V)
      5'd22: letra_out = W;  // Caso 22 (W)
      5'd23: letra_out = X;  // Caso 23 (X)
      5'd24: letra_out = Y;  // Caso 24 (Y)
      5'd25: letra_out = Z;  // Caso 25 (Z)
      default: letra_out = 7'b0000000;  // Caso por defecto para apagar todos los segmentos 
    endcase
  end
endmodule
