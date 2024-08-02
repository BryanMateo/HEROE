module top (
    input clk,
    input [1:0] W_or_L,
    input [3:0] columna,
    output [3:0] fila,
    output [6:0] displayout
);
  wire [4:0] key;
  wire keypad_pressed;

  wire [2:0] tipo_h;
  wire [1:0] var_h;
  wire [6:0] heroe;

  wire [3:0] tipo_obs;
  wire [6:0] obstaculo;

  // wire [1:0] W_or_L;
  wire fsm_error;
  wire [2:0] presente;

  wire [27:0] display_menu;

   wire [7:0] selector;

  fsm fsm (
      .clk(clk),
      .keypad_pressed(keypad_pressed),
      .key(key),
      .W_or_L(W_or_L),
      .fsm_error(fsm_error),
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
      .displayout(displayout),
      .selector(selector)
  );

  menu menu (
      .clk(clk),
      .presente(presente),
      .display_menu(display_menu)
  );

endmodule
