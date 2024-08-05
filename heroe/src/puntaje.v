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
    input [2:0] presente,
    output [20:0] display_puntaje

);

  wire [9:0] puntos_bin;
  assign puntos_bin = puntos + puntos_bono;

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

  reg [7:0] puntos = 8'd0;
  always @(negedge clk_puntaje) begin
    if (presente == GAME) begin
      if (W_or_L == 2'b00) begin
        puntos <= puntos + 8'd1;
      end
    end else if (presente == WL) begin
      //nada para que mantenga el score
    end else begin
      puntos <= 9'd0;
    end
  end

  reg condicion = 1'b0;
  reg [1:0] bono = 2'd0;
  reg [7:0] puntos_bono = 8'd0;

  always @(posedge clk) begin

    if (presente == GAME) begin
      if (bono_tomado) begin
        if (!condicion) begin

          if (W_or_L == 2'b00) begin
            case (bono)
              2'd0: begin
                puntos_bono <= puntos_bono + 8'd10;
                bono <= bono + 2'd1;
              end
              2'd1: begin
                puntos_bono <= puntos_bono + 8'd30;
                bono <= bono + 2'd1;
              end
              2'd2: begin
                puntos_bono <= puntos_bono + 8'd45;
                bono <= bono + 2'd1;
              end
              default: begin
                //nada
              end
            endcase
            condicion <= 1'b1;
          end
        end
      end else begin
        condicion <= 1'b0;
      end
    end else if (presente == WL) begin
      //nada para que mantenga el score
    end else begin
      puntos_bono <= 8'd0;
      bono <= 2'd0;
    end

  end


  ////////////////////////////////////////////////////////////
  reg [3:0] hundreds;
  reg [3:0] tens;
  reg [3:0] ones;
  integer i;
  reg [11:0] shift_reg;
  always @(puntos_bin) begin
    // Inicializar el registro de desplazamiento con los 10 bits de entrada y rellenar con ceros
    shift_reg = {12'b0};

    // Iterar 10 veces para desplazar y ajustar
    for (i = 0; i < 10; i = i + 1) begin
      // Ajustar centenas, decenas y unidades si es necesario
      if (shift_reg[3:0] >= 5) shift_reg[3:0] = shift_reg[3:0] + 3;
      if (shift_reg[7:4] >= 5) shift_reg[7:4] = shift_reg[7:4] + 3;
      if (shift_reg[11:8] >= 5) shift_reg[11:8] = shift_reg[11:8] + 3;

      // Desplazar el registro hacia la izquierda
      shift_reg = {shift_reg[10:0], puntos_bin[9-i]};
    end

    // Asignar los valores de centenas, decenas y unidades
    hundreds = shift_reg[11:8];
    tens = shift_reg[7:4];
    ones = shift_reg[3:0];
  end

  function [6:0] bcd_to_7seg;
    input [3:0] bcd;
    case (bcd)
      4'b0000: bcd_to_7seg = 7'b0111111;  // 0
      4'b0001: bcd_to_7seg = 7'b0000110;  // 1
      4'b0010: bcd_to_7seg = 7'b1011011;  // 2
      4'b0011: bcd_to_7seg = 7'b1001111;  // 3
      4'b0100: bcd_to_7seg = 7'b1100110;  // 4
      4'b0101: bcd_to_7seg = 7'b1101101;  // 5
      4'b0110: bcd_to_7seg = 7'b1111101;  // 6
      4'b0111: bcd_to_7seg = 7'b0000111;  // 7
      4'b1000: bcd_to_7seg = 7'b1111111;  // 8
      4'b1001: bcd_to_7seg = 7'b1101111;  // 9
      default: bcd_to_7seg = 7'b0000000;  // Apagado
    endcase
  endfunction

  // Asignar segmentos de 7
  assign display_puntaje[6:0]   = bcd_to_7seg(hundreds);
  assign display_puntaje[13:7]  = bcd_to_7seg(tens);
  assign display_puntaje[20:14] = bcd_to_7seg(ones);
endmodule


