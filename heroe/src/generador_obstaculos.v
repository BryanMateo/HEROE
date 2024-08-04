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
    parameter PA = 3'd5
) (
    input clk,
    input [6:0] obstaculo,
    input [2:0] presente,
    output reg clk_obstaculos,
    output reg [3:0] tipo_obs = 4'd0,
    output reg [20:0] display_obs = 21'd0
);


  reg [27:0] counter = 28'd0;
  localparam DIVISOR = 28'd13500000;
  always @(posedge clk) begin
    counter <= counter + 28'd1;
    if (counter >= (DIVISOR - 1)) counter <= 28'd0;
    clk_obstaculos <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
  end

  reg [N:0] r_reg = 4'd1;
  wire [N:0] r_next;
  wire feedback_value;

  reg condicion;
  reg [1:0] obs_counter = 2'd0;
  reg [3:0] world_counter = 4'd0;
  always @(posedge clk_obstaculos) begin

    if (presente == GAME) begin
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
            r_reg <= r_next;
            display_obs[20:14] <= 7'd0;
          end
          2'd2: begin
            tipo_obs <= r_reg;
            display_obs[20:14] <= obstaculo;
          end
          2'd3: begin
            r_reg <= r_next;
            display_obs[20:14] <= 7'd0;
          end
        endcase
        display_obs[6:0]  <= display_obs[13:7];
        display_obs[13:7] <= display_obs[20:14];
      end
    end else if (presente == WL) begin
      //nada para que retenga la posicion de los obstaculos
    end else begin
      condicion   <= 1'b0;
      obs_counter <= 2'd0;
      display_obs <= 21'd0;
      if (world_counter == 0) world_counter <= 4'd1;
      else world_counter <= world_counter + 1'd1;
    end
  end
  assign feedback_value = r_reg[3] ^ r_reg[2] ^ r_reg[0];
  assign r_next = {feedback_value, r_reg[N:1]};

endmodule

