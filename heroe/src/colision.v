module colision #(
    // PARAMETROS MAQUINA DE ESTADO
    parameter OFF  = 3'd0,
    parameter WLCM = 3'd1,
    parameter CH   = 3'd2,
    parameter GAME = 3'd3,
    parameter WL   = 3'd4,
    parameter PA   = 3'd5
) (
    input clk_obstaculos,
    input [1:0] mundo,
    input [2:0] presente,
    input [20:0] display_obs,
    input [6:0] heroe,
    output reg [1:0] W_or_L = 2'b00,
    output reg bono_tomado = 1'b0
);

  always @(negedge clk_obstaculos) begin
    if (presente == GAME || presente == WL) begin
      if (mundo == 2'd3) begin
        W_or_L = 2'b10;
      end
      // if (display_obs[6] == 1'b1 && heroe[6] == 1'b1) begin
      //   W_or_L = 2'b01;
      // end else if (display_obs[5] == 1'b1 && heroe[5] == 1'b1) begin
      //   W_or_L = 2'b01;
      // end else if (display_obs[4] == 1'b1 && heroe[4] == 1'b1) begin
      //   W_or_L = 2'b01;
      // end else if (display_obs[3] == 1'b1 && heroe[3] == 1'b1) begin
      //   W_or_L = 2'b01;
      // end else if (display_obs[2] == 1'b1 && heroe[2] == 1'b1) begin
      //   W_or_L = 2'b01;
      // end else if (display_obs[1] == 1'b1 && heroe[1] == 1'b1) begin
      //   W_or_L = 2'b01;
      // end else if (display_obs[0] == 1'b1 && heroe[0] == 1'b1) begin
      //   W_or_L = 2'b01;
      // end
    end else begin
      W_or_L = 2'b00;
    end

    if (presente == GAME) begin
      if (display_obs[6:0] == 7'b1111111) begin
        bono_tomado <= 1'b1;
      end else bono_tomado <= 1'b0;
    end else bono_tomado <= 1'b0;

  end



endmodule
