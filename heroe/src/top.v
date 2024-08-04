module top (
    input clk,
    input [3:0] columna,
    output [3:0] fila,
    output [6:0] displayout,
    output wire [7:0] selector
);
  wire [4:0] key;
  wire keypad_pressed;

  wire [2:0] tipo_h;
  wire [1:0] var_h;
  wire [6:0] heroe;

  wire [4:0] tipo_obs;
  wire [6:0] obstaculo;

  wire [1:0] W_or_L;
  wire [2:0] presente;
  wire [27:0] display_menu;

  wire [20:0] display_obs;

  wire clk_obstaculos;

  fsm fsm (
      .clk(clk),
      .keypad_pressed(keypad_pressed),
      .key(key),
      .W_or_L(W_or_L),
      .presente(presente)
  );

  keypad keypad (
      .clk(clk),
      .columna(columna),
      .fila(fila),
      .key(key),
      .keypad_pressed(keypad_pressed)
  );

  display display (
      .clk(clk),
      .presente(presente),
      .display_menu(display_menu),
      .heroe(heroe),
      .display_obs(display_obs),
      .displayout(displayout),
      .selector(selector)
  );

  menu menu (
      .clk(clk),
      .presente(presente),
      .W_or_L(W_or_L),
      .display_menu(display_menu)
  );

  rom_heroe rom_heroe (
      .tipo_h(tipo_h),
      .var_h (var_h),
      .heroe (heroe)
  );

  choose_hero choose_hero (
      .clk(clk),
      .keypad_pressed(keypad_pressed),
      .key(key),
      .presente(presente),
      .tipo_h(tipo_h),
      .var_h(var_h)
  );

  generador_obstaculos generador_obstaculos (
      .clk(clk),
      .obstaculo(obstaculo),
      .presente(presente),
      .W_or_L(W_or_L),
      .clk_obstaculos(clk_obstaculos),
      .tipo_obs(tipo_obs),
      .display_obs(display_obs)
  );

  rom_obstaculos rom_obstaculos (
      .tipo_obs (tipo_obs),
      .obstaculo(obstaculo)
  );

  colision colision (
      .clk_obstaculos(clk_obstaculos),
      .presente(presente),
      .display_obs(display_obs),
      .heroe(heroe),
      .W_or_L(W_or_L)
  );

endmodule
