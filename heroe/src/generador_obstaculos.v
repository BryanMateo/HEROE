module generador_obstaculos #(
    parameter N = 3,
    // PARAMETROS MAQUINA DE ESTADO
    parameter OFF = 3'd0,
    parameter WLCM = 3'd1,
    parameter CH = 3'd2,
    parameter GAME = 3'd3,
    parameter WL = 3'd4,
    parameter PA = 3'd5,

    parameter mundo1 = 30,
    parameter mundo2 = 40,
    parameter mundo3 = 50
) (
    input clk,
    input [6:0] obstaculo,
    input [2:0] presente,
    input bono_tomado,
    input [1:0] W_or_L,
    output reg clk_obstaculos,
    output reg [1:0] mundo = 2'd0,
    output reg [4:0] tipo_obs = 4'd0,
    output reg [20:0] display_obs = 21'd0,
    output reg [4:0] progreso
);

  always @(*) begin
    case (mundo)
      2'd1: DIVISOR = 28'd13500000;  //2
      2'd2: DIVISOR = 28'd10800000;  //2.5
      default: DIVISOR = 28'd18000000;  //1.5
    endcase
  end
  reg [27:0] counter = 28'd0;
  reg [29:0] DIVISOR;
  always @(posedge clk) begin
    counter <= counter + 28'd1;
    if (counter >= (DIVISOR - 1)) counter <= 28'd0;
    clk_obstaculos <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
  end

  reg [N:0] r_reg = 4'd1;
  wire [N:0] r_next;
  wire feedback_value;
  reg condicion = 1'b0;
  reg condicion_bono = 1'b0;

  reg [1:0] obs_counter = 2'd0;
  reg [3:0] world_counter = 4'd1;

  reg [6:0] conteo_obs;
  reg [6:0] valor_obs;

  // always @(posedge bono_tomado) begin
  //   mundo = mundo + 2'd1;
  // end

  always @(posedge clk) begin
    if (presente == GAME || presente == WL) begin
      if (bono_tomado) begin
        if (!condicion_bono) begin
          mundo <= mundo + 2'd1;
          condicion_bono <= 1'b1;
        end
      end else condicion_bono <= 1'b0;
    end else begin
      mundo <= 2'd0;
    end

    case (mundo)
      2'd1: valor_obs <= mundo2;
      2'd2: valor_obs <= mundo3;
      default: valor_obs <= mundo1;
    endcase
  end


  reg [2:0] mundo_ant;
  reg [4:0] show_leds = 5'd0;
  reg [4:0] show_leds_out;
  always @(posedge clk_obstaculos) begin
    if (presente == GAME && W_or_L == 2'b00) begin
      if (!condicion) begin
        mundo_ant <= mundo;
        conteo_obs <= valor_obs;
        r_reg <= world_counter;
        condicion <= 1'b1;
      end else if (mundo != 2'd3) begin
        if (conteo_obs != 7'd0) begin
          conteo_obs  <= conteo_obs - 7'd1;
          obs_counter <= obs_counter + 1'd1;
          case (obs_counter)
            2'd0: begin
              tipo_obs <= r_reg;
              display_obs[20:14] <= obstaculo;
            end
            2'd1: begin
              display_obs[20:14] <= 7'd0;
              r_reg <= r_next;
            end
            2'd2: begin
              tipo_obs <= r_reg;
              display_obs[20:14] <= obstaculo;
            end
            2'd3: begin
              display_obs[20:14] <= 7'd0;
              r_reg <= r_next;
            end
          endcase
        end

        if (conteo_obs == 7'd2) begin
          tipo_obs <= 7'd16;
          display_obs[20:14] <= 7'd0;
        end else if (conteo_obs == 7'd1) begin
          tipo_obs <= r_reg;
          obs_counter <= 2'd0;
          if (mundo == 2'd3) display_obs[20:14] <= 7'd0;
          else display_obs[20:14] <= obstaculo;
        end else if (conteo_obs == 7'd0) begin
          if (mundo != 2'd3) begin
            if (mundo_ant != mundo) begin
              condicion <= 1'b0;
            end
          end
          display_obs[20:14] <= 7'd0;
        end
      end
    end

    if (W_or_L == 2'b00) begin
      display_obs[6:0]  <= display_obs[13:7];
      display_obs[13:7] <= display_obs[20:14];
    end else if (W_or_L == 2'b10 || W_or_L == 2'b01) begin
      //nada para que retenga la posicion de los obstaculos
    end

    if (presente != GAME && |presente != WL) begin
      condicion   <= 1'b0;
      obs_counter <= 2'd0;
      display_obs <= 21'd0;
      conteo_obs  <= mundo1;
    end

    if (world_counter == 4'd15) world_counter <= 4'd1;
    else world_counter <= world_counter + 1'd1;

    if (W_or_L == 2'b10) begin
      show_leds <= show_leds + 1'b1;
      case (show_leds)
        5'd0: show_leds_out <= 5'b10011;
        5'd1: show_leds_out <= 5'b11111;
        5'd2: show_leds_out <= 5'b00111;
        5'd3: show_leds_out <= 5'b11100;
        5'd4: show_leds_out <= 5'b10011;
        5'd5: show_leds_out <= 5'b01001;
        5'd6: show_leds_out <= 5'b11010;
        5'd7: show_leds_out <= 5'b11010;
        5'd8: show_leds_out <= 5'b00111;
        5'd9: show_leds_out <= 5'b11101;
        5'd10: show_leds_out <= 5'b00011;
        5'd11: show_leds_out <= 5'b11100;
        5'd12: show_leds_out <= 5'b00100;
        5'd13: show_leds_out <= 5'b11010;
        5'd14: show_leds_out <= 5'b10111;
        5'd15: show_leds_out <= 5'b11101;
        5'd16: show_leds_out <= 5'b01011;
        5'd17: show_leds_out <= 5'b11100;
        5'd18: show_leds_out <= 5'b00011;
        5'd19: show_leds_out <= 5'b11111;
        5'd20: show_leds_out <= 5'b11010;
        5'd21: show_leds_out <= 5'b10111;
        5'd22: show_leds_out <= 5'b11101;
        5'd23: show_leds_out <= 5'b01011;
        5'd24: show_leds_out <= 5'b11100;
        5'd25: show_leds_out <= 5'b00011;
        5'd26: show_leds_out <= 5'b11111;
        default: show_leds_out <= 5'b11111;
      endcase
    end else show_leds <= 5'd0;
  end

  assign feedback_value = r_reg[3] ^ r_reg[2] ^ r_reg[0];
  assign r_next = {feedback_value, r_reg[N:1]};


  always @(*) begin
    if (W_or_L == 2'b00) begin
      case (mundo)
        2'd0: begin
          if (conteo_obs < ((20 * mundo1) / 100)) progreso = 5'b11111;
          else if (conteo_obs < ((35 * mundo1) / 100)) progreso = 5'b01111;
          else if (conteo_obs < ((55 * mundo1) / 100)) progreso = 5'b00111;
          else if (conteo_obs < ((80 * mundo1) / 100)) progreso = 5'b00011;
          else if (conteo_obs < ((95 * mundo1) / 100)) progreso = 5'b00001;
          else progreso = 5'b00000;
        end

        2'd1: begin
          if (conteo_obs < ((15 * mundo2) / 100)) progreso = 5'b11111;
          else if (conteo_obs < ((25 * mundo2) / 100)) progreso = 5'b01111;
          else if (conteo_obs < ((40 * mundo2) / 100)) progreso = 5'b00111;
          else if (conteo_obs < ((60 * mundo2) / 100)) progreso = 5'b00011;
          else if (conteo_obs < ((85 * mundo2) / 100)) progreso = 5'b00001;
          else progreso = 5'b00000;
        end

        2'd2: begin
          if (conteo_obs < ((5 * mundo3) / 100)) progreso = 5'b11111;
          else if (conteo_obs < ((20 * mundo3) / 100)) progreso = 5'b01111;
          else if (conteo_obs < ((35 * mundo3) / 100)) progreso = 5'b00111;
          else if (conteo_obs < ((50 * mundo3) / 100)) progreso = 5'b00011;
          else if (conteo_obs < ((80 * mundo3) / 100)) progreso = 5'b00001;
          else progreso = 5'b00000;
        end

        default: progreso = 5'b00000;
      endcase
    end else if (W_or_L == 2'b10) begin
      progreso = ~show_leds_out;
    end else progreso = 5'b00000;
  end

endmodule

