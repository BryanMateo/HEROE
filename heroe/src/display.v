module display (
    input clk,
    input [2:0] presente,
    input [27:0] display_menu,
    input [6:0] heroe,
    input [20:0] display_obs,
    input [20:0] display_puntaje,
    output reg [6:0] displayout,
    output reg [7:0] selector

);
  reg [6:0]
      display0,  //0-3 display grande, 4-7 display pequeño
      display1,
      display2,
      display3,
      display4,
      display5,
      display6,
      display7;

  // PARAMETROS MAQUINA DE ESTADO
  parameter OFF = 3'd0;
  parameter WLCM = 3'd1;
  parameter CH = 3'd2;
  parameter GAME = 3'd3;
  parameter WL = 3'd4;
  parameter PA = 3'd5;

  always @(posedge clk) begin
    case (presente)
      OFF: begin
        display0 <= 7'd0;
        display1 <= 7'd0;
        display2 <= 7'd0;
        display3 <= 7'd0;
        display4 <= 7'd0;
        display5 <= 7'd0;
        display6 <= 7'd0;
        display7 <= 7'd0;
      end
      WLCM: begin
        display0 <= 7'd0;
        display1 <= 7'd0;
        display2 <= 7'd0;
        display3 <= 7'd0;
        display4 <= display_menu[27:21];
        display5 <= display_menu[20:14];
        display6 <= display_menu[13:7];
        display7 <= display_menu[6:0];
      end
      CH: begin
        display0 <= display_menu[27:21];
        display1 <= display_menu[20:14];
        display2 <= display_menu[13:7];
        display3 <= display_menu[6:0];
        display4 <= 7'd0;
        display5 <= 7'd0;
        display6 <= 7'd0;
        display7 <= heroe;
      end
      GAME: begin
        // display0 <= 7'd0;
        // display1 <= 7'd0;
        // display2 <= 7'd0;
        // display3 <= 7'd0;
        // display4 <= display_obs[20:14];
        // display5 <= display_obs[13:7];
        // display6 <= display_obs[6:0];
        // display7 <= heroe;
        display0 <= 7'd0;
        display1 <= display_puntaje[20:14];
        display2 <= display_puntaje[13:7];
        display3 <= display_puntaje[6:0];
        display4 <= display_obs[20:14];
        display5 <= display_obs[13:7];
        display6 <= display_obs[6:0];
        display7 <= heroe;
      end
      WL: begin
        display0 <= display_puntaje[20:14];
        display1 <= display_puntaje[13:7];
        display2 <= display_puntaje[6:0];
        display3 <= 7'd0;
        display4 <= display_menu[27:21];
        display5 <= display_menu[20:14];
        display6 <= display_menu[13:7];
        display7 <= display_menu[6:0];
      end
      PA: begin
        display0 <= 7'd0;
        display1 <= 7'd0;
        display2 <= 7'd0;
        display3 <= 7'd0;
        display4 <= display_menu[27:21];
        display5 <= display_menu[20:14];
        display6 <= display_menu[13:7];
        display7 <= display_menu[6:0];
      end
      default: begin
        display0 <= 7'd0;
        display1 <= 7'd0;
        display2 <= 7'd0;
        display3 <= 7'd0;
        display4 <= 7'd0;
        display5 <= 7'd0;
        display6 <= 7'd0;
        display7 <= 7'd0;
      end
    endcase
  end

  reg clk_barrido;
  reg [27:0] counter = 27'd0;
  parameter DIVISOR = 27'd1350;
  always @(posedge clk) begin
    counter <= counter + 28'd1;
    if (counter >= (DIVISOR - 1)) counter <= 28'd0;
    clk_barrido <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
  end

  reg [2:0] pos_count = 3'd0;
  always @(posedge clk_barrido) //contador para posicion del digito en display
    begin
    pos_count <= pos_count + 3'd1;
    case (pos_count)  //selector del display
      3'd0: begin
        selector   <= 8'b00000001;
        displayout <= ~display0;
      end
      3'd1: begin
        selector   <= 8'b00000010;
        displayout <= ~display1;
      end
      3'd2: begin
        selector   <= 8'b00000100;
        displayout <= ~display2;
      end
      3'd3: begin
        selector   <= 8'b00001000;
        displayout <= ~display3;
      end
      3'd4: begin
        selector   <= 8'b00010000;
        displayout <= ~display4;
      end
      3'd5: begin
        selector   <= 8'b00100000;
        displayout <= ~display5;
      end
      3'd6: begin
        selector   <= 8'b01000000;
        displayout <= ~display6;
      end
      3'd7: begin
        selector   <= 8'b10000000;
        displayout <= ~display7;
      end
    endcase
  end
endmodule
