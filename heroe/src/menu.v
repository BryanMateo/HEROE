module menu (
    input clk,
    input [2:0] presente,
    input [1:0] W_or_L,
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

  reg [2:0] pasado;
  reg [4:0] barrido;
  always @(posedge clk_menu) begin

    if (presente != OFF) begin
      barrido <= barrido + 1'd1;
    end else begin
      barrido <= 5'd0;
      display_menu[27:21] <= 7'd0;
    end

    if (pasado != presente) begin  //para evitar bugs en el display
      pasado <= presente;
      display_menu <= 28'd0;
      barrido <= 5'd0;
    end else begin
      display_menu[6:0]   <= display_menu[13:7];
      display_menu[13:7]  <= display_menu[20:14];
      display_menu[20:14] <= display_menu[27:21];

      case (presente)
        WLCM: begin
          if (barrido >= 5'd8) barrido <= 5'd0;
          case (barrido)
            5'd1: display_menu[27:21] <= H;
            5'd2: display_menu[27:21] <= O;
            5'd3: display_menu[27:21] <= L;
            5'd4: display_menu[27:21] <= A;
            default: display_menu[27:21] <= 7'd0;
          endcase
        end

        CH: begin
          if (barrido >= 5'd15) barrido <= 5'd0;
          case (barrido)
            5'd1: display_menu[27:21] <= C;
            5'd2: display_menu[27:21] <= H;
            5'd3: display_menu[27:21] <= O;
            5'd4: display_menu[27:21] <= O;
            5'd5: display_menu[27:21] <= S;
            5'd6: display_menu[27:21] <= E;
            5'd7: display_menu[27:21] <= 7'd0;
            5'd8: display_menu[27:21] <= H;
            5'd9: display_menu[27:21] <= E;
            5'd10: display_menu[27:21] <= R;
            5'd11: display_menu[27:21] <= O;
            default: display_menu[27:21] <= 7'd0;
          endcase
        end

        WL: begin
          if (W_or_L == 2'b10) begin
            if (barrido >= 5'd11) barrido <= 5'd0;
            case (barrido)
              5'd1: display_menu[27:21] <= Y;
              5'd2: display_menu[27:21] <= O;
              5'd3: display_menu[27:21] <= U;
              5'd4: display_menu[27:21] <= 7'd0;
              5'd5: display_menu[27:21] <= W;
              5'd6: display_menu[27:21] <= I;
              5'd7: display_menu[27:21] <= N;
              default: display_menu[27:21] <= 7'd0;
            endcase
          end else if (W_or_L == 2'b01) begin
            if (barrido >= 5'd12) barrido <= 5'd0;
            case (barrido)
              5'd1: display_menu[27:21] <= Y;
              5'd2: display_menu[27:21] <= O;
              5'd3: display_menu[27:21] <= U;
              5'd4: display_menu[27:21] <= 7'd0;
              5'd5: display_menu[27:21] <= L;
              5'd6: display_menu[27:21] <= O;
              5'd7: display_menu[27:21] <= S;
              5'd8: display_menu[27:21] <= T;
              default: display_menu[27:21] <= 7'd0;
            endcase
          end

        end

        default: display_menu[27:21] <= 7'd0;
      endcase
    end


  end

endmodule
