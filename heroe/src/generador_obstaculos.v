// module juego (
//     input clk,

// );

// endmodule

module generador_obstaculos #(
    parameter N = 3,
    // PARAMETROS MAQUINA DE ESTADO
    parameter OFF = 3'd0,
    parameter WLCM = 3'd1,
    parameter CH = 3'd2,
    parameter GAME = 3'd3,
    parameter WL = 3'd4,
    parameter PA = 3'd5,

    parameter nMundo = 5
) (
    input clk,
    input [6:0] obstaculo,
    input [2:0] presente,
    input [1:0] W_or_L,
    output reg clk_obstaculos,
    output reg [4:0] tipo_obs = 4'd0,
    output reg [20:0] display_obs = 21'd0
);
  ///////////////////////////////////////////////
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

  localparam DIVISOR1hz = 28'd27000000;
  reg [27:0] counter1hz = 28'd0;
  reg clk_1hz;
  always @(posedge clk) begin
    counter1hz <= counter1hz + 28'd1;
    if (counter1hz >= (DIVISOR1hz - 1)) counter1hz <= 28'd0;
    clk_1hz <= (counter1hz < DIVISOR1hz / 2) ? 1'b1 : 1'b0;
  end
  ///////////////////////////////////////////////

  reg [6:0] tiempo_mundo = nMundo;
  reg [1:0] mundo;
  reg [1:0] mundo_ant;
  always @(posedge clk_1hz) begin
    if (presente == GAME) begin
      if (mundo_ant == mundo) begin
        if (tiempo_mundo == 7'd0) begin
          if (mundo == 2'd2) begin
            mundo <= 2'd0;
          end else mundo <= mundo + 2'd1;
          tiempo_mundo <= nMundo;
        end else begin
          tiempo_mundo <= tiempo_mundo - 7'd1;
        end
      end else begin
        mundo_ant <= mundo;
      end
    end else begin  // cualquier otro estado resetea los contadores
      mundo <= 2'd0;
      mundo_ant <= 2'd0;
      tiempo_mundo <= nMundo;
    end
  end


  reg [N:0] r_reg = 4'd1;
  wire [N:0] r_next;
  wire feedback_value;
  reg condicion;
  reg [1:0] obs_counter = 2'd0;
  reg [3:0] world_counter = 4'd0;
  always @(posedge clk_obstaculos) begin

    if (presente == GAME && W_or_L == 2'b00) begin
      if (!condicion) begin
        r_reg <= world_counter;
        condicion <= 1'b1;
      end else begin
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
        display_obs[6:0]  <= display_obs[13:7];
        display_obs[13:7] <= display_obs[20:14];
      end
    end else if (W_or_L == 2'b10 || W_or_L == 2'b01) begin
      //nada para que retenga la posicion de los obstaculos
    end else begin
      condicion   <= 1'b0;
      obs_counter <= 2'd0;
      display_obs <= 21'd0;
    end
    if (world_counter == 0) world_counter <= 4'd1;
    else world_counter <= world_counter + 1'd1;
  end

  assign feedback_value = r_reg[3] ^ r_reg[2] ^ r_reg[0];
  assign r_next = {feedback_value, r_reg[N:1]};

endmodule

