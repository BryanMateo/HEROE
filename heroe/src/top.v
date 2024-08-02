module top (
    input clk,
    input [1:0] W_or_L,
    input [3:0] columna,
    output [3:0] fila,
    output keypad_pressed
); 
  wire [4:0] key;
  //wire keypad_pressed;

  wire [2:0] tipo_h;
  wire [1:0] var_h;
  wire [6:0] heroe;

  wire [3:0] tipo_obs;
  wire [6:0] obstaculo;

  wire [4:0] letra;
  wire [6:0] letra_out;

 // wire [1:0] W_or_L;
  wire fsm_error;
  wire [2:0] presente;

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

endmodule
