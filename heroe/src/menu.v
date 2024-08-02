module menu (
    input clk,
    input [2:0] presente,
    output reg [27:0] display_menu
);
  //PARAMETROS ROM LETRAS
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

  // PARAMETROS MAQUINA DE ESTADO
  parameter OFF = 3'd0;
  parameter WLCM = 3'd1;
  parameter CH = 3'd2;
  parameter GAME = 3'd3;
  parameter WL = 3'd4;
  parameter PA = 3'd5;

  reg clk_menu;
  reg [27:0] counter_menu = 28'd0;
  parameter DIVISOR_menu = 28'd9000000;
  always @(posedge clk) begin
    counter_menu <= counter_menu + 28'd1;
    if (counter_menu >= (DIVISOR_menu - 1)) counter_menu <= 28'd0;
    clk_menu <= (counter_menu < DIVISOR_menu / 2) ? 1'b1 : 1'b0;
  end

  reg [4:0] barrido;
  always @(posedge clk_menu) begin
    barrido <= barrido + 1'd1;
    case (presente)
      OFF: begin
        barrido <= 5'd0;
        display_menu[6:0]   = 7'd0;
        display_menu[13:7]  = 7'd0;
        display_menu[20:14] = 7'd0;
        display_menu[27:21] = 7'd0;
      end
      WLCM: begin
        if (barrido >= 5'd7) barrido <= 5'd0;
        case (barrido)
          5'd0: begin
            display_menu[6:0]   = 7'd0;
            display_menu[13:7]  = 7'd0;
            display_menu[20:14] = 7'd0;
            display_menu[27:21] = H;
          end
          5'd1: begin
            display_menu[6:0]   = 7'd0;
            display_menu[13:7]  = 7'd0;
            display_menu[20:14] = H;
            display_menu[27:21] = O;
          end
          5'd2: begin
            display_menu[6:0]   = 7'd0;
            display_menu[13:7]  = H;
            display_menu[20:14] = O;
            display_menu[27:21] = L;
          end
          5'd3: begin
            display_menu[6:0]   = H;
            display_menu[13:7]  = O;
            display_menu[20:14] = L;
            display_menu[27:21] = A;
          end
          5'd4: begin
            display_menu[6:0]   = O;
            display_menu[13:7]  = L;
            display_menu[20:14] = A;
            display_menu[27:21] = 7'd0;
          end
          5'd5: begin
            display_menu[6:0]   = L;
            display_menu[13:7]  = A;
            display_menu[20:14] = 7'd0;
            display_menu[27:21] = 7'd0;
          end
          5'd6: begin
            display_menu[6:0]   = A;
            display_menu[13:7]  = 7'd0;
            display_menu[20:14] = 7'd0;
            display_menu[27:21] = 7'd0;
          end
          5'd7: begin
            display_menu[6:0]   = 7'd0;
            display_menu[13:7]  = 7'd0;
            display_menu[20:14] = 7'd0;
            display_menu[27:21] = 7'd0;
          end
        endcase
      end

      CH: begin
        if (barrido >= 5'd14) barrido <= 5'd0;
        case (barrido)
          5'd0: begin
            display_menu[6:0]   = 7'd0;
            display_menu[13:7]  = 7'd0;
            display_menu[20:14] = 7'd0;
            display_menu[27:21] = C;
          end
          5'd1: begin
            display_menu[6:0]   = 7'd0;
            display_menu[13:7]  = 7'd0;
            display_menu[20:14] = C;
            display_menu[27:21] = H;
          end
          5'd2: begin
            display_menu[6:0]   = 7'd0;
            display_menu[13:7]  = C;
            display_menu[20:14] = H;
            display_menu[27:21] = O;
          end
          5'd3: begin
            display_menu[6:0]   = C;
            display_menu[13:7]  = H;
            display_menu[20:14] = O;
            display_menu[27:21] = O;
          end
          5'd4: begin
            display_menu[6:0]   = H;
            display_menu[13:7]  = O;
            display_menu[20:14] = O;
            display_menu[27:21] = S;
          end
          5'd5: begin
            display_menu[6:0]   = O;
            display_menu[13:7]  = O;
            display_menu[20:14] = S;
            display_menu[27:21] = E;
          end
          5'd6: begin
            display_menu[6:0]   = O;
            display_menu[13:7]  = S;
            display_menu[20:14] = E;
            display_menu[27:21] = 7'd0;
          end
          5'd7: begin
            display_menu[6:0]   = S;
            display_menu[13:7]  = E;
            display_menu[20:14] = 7'd0;
            display_menu[27:21] = H;
          end
          5'd8: begin
            display_menu[6:0]   = E;
            display_menu[13:7]  = 7'd0;
            display_menu[20:14] = H;
            display_menu[27:21] = E;
          end
          5'd9: begin
            display_menu[6:0]   = 7'd0;
            display_menu[13:7]  = H;
            display_menu[20:14] = E;
            display_menu[27:21] = R;
          end
          5'd10: begin
            display_menu[6:0]   = H;
            display_menu[13:7]  = E;
            display_menu[20:14] = R;
            display_menu[27:21] = O;
          end
          5'd11: begin
            display_menu[6:0]   = E;
            display_menu[13:7]  = R;
            display_menu[20:14] = O;
            display_menu[27:21] = 7'd0;
          end
          5'd12: begin
            display_menu[6:0]   = R;
            display_menu[13:7]  = O;
            display_menu[20:14] = 7'd0;
            display_menu[27:21] = 7'd0;
          end
          5'd13: begin
            display_menu[6:0]   = O;
            display_menu[13:7]  = 7'd0;
            display_menu[20:14] = 7'd0;
            display_menu[27:21] = 7'd0;
          end
          5'd14: begin
            display_menu[6:0]   = 7'd0;
            display_menu[13:7]  = 7'd0;
            display_menu[20:14] = 7'd0;
            display_menu[27:21] = 7'd0;
          end
        endcase
      end

      default: begin
        //nada
      end
    endcase

  end

endmodule
