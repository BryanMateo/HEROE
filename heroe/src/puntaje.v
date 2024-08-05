module puntaje #(
    // PARAMETROS MAQUINA DE ESTADO
    parameter OFF  = 3'd0,
    parameter WLCM = 3'd1,
    parameter CH   = 3'd2,
    parameter GAME = 3'd3,
    parameter WL   = 3'd4,
    parameter PA   = 3'd5
) (
    input clk,
    bono_tomado,
    input [1:0] W_or_L,
    mundo,
    input [2:0] presente,
    output [27:0] display_puntaje

);
  //////////////////////////////////////////
  reg clk_puntaje;
  reg [27:0] counter = 27'd0;
  localparam DIVISOR = 27'd27000000;
  always @(posedge clk) begin
    counter <= counter + 28'd1;
    if (counter >= (DIVISOR - 1)) counter <= 28'd0;
    clk_puntaje <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
  end
  //////////////////////////////////////////

  reg [8:0] puntos = 9'd0;
  always @(posedge clk_puntaje) begin

    if (presente == GAME) begin
      if (W_or_L == 2'b00) begin
        puntos <= puntos + 9'd1;
      end
    end

    if (bono_tomado == 1'b1) begin
      if (presente == GAME) begin
        if (W_or_L == 2'b00) begin
          case (mundo)
            2'd1: puntos <= puntos + 9'd10;
            2'd2: puntos <= puntos + 9'd30;
            2'd3: puntos <= puntos + 9'd45;
            default: begin
              //nada
            end
          endcase
        end

      end
    end
  end
endmodule


