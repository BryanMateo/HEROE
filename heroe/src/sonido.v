module sonido #(
    // PARAMETROS MAQUINA DE ESTADO
    parameter OFF  = 3'd0,
    parameter WLCM = 3'd1,
    parameter CH   = 3'd2,
    parameter GAME = 3'd3,
    parameter WL   = 3'd4,
    parameter PA   = 3'd5,

    // Parámetros de los divisores de reloj para las frecuencias deseadas
    parameter DO5_DIV = 51588,  // Para 523.25 Hz 
    parameter RE5_DIV = 43472,  // Para 622.25 Hz
    parameter FA5_DIV = 38662,  // Para 698.46 Hz
    parameter SOL5_DIV = 34456,  // Para 783.99 Hz
    parameter SIB5_DIV = 28960,  // Para 932.33 Hz
    parameter FA = 3'd1,
    parameter RE = 3'd2,
    parameter SOL = 3'd3,
    parameter DO = 3'd4,
    parameter SIB = 3'd5

) (
    input clk,
    keypad_pressed,
    input [2:0] presente,
    input [1:0] W_or_L,
    output reg buzzer
);

  reg [8:0] cont_keypad_pressed = 9'd0;
  reg cont_cond = 1'b0;
  reg condicion = 1'b0;

  always @(posedge clk_1000hz) begin
    if (keypad_pressed) begin
      if (!condicion) begin
        cont_cond <= 1'b1;
        condicion <= 1'b1;
      end
    end else condicion <= 1'b0;

    if (cont_cond) begin
      if (cont_keypad_pressed <= 9'd100) begin  //cont_keypad_pressed tiempo en ms
        cont_keypad_pressed <= cont_keypad_pressed + 9'd1;
        nota <= FA;
      end else begin
        nota <= 0;
        cont_cond <= 1'b0;
        cont_keypad_pressed <= 9'd0;
      end
    end
  end

  reg [2:0] nota;
  // Selección del divisor basado en la entrada sel
  always @(*) begin
    case (nota)
      3'd1: div_value = FA5_DIV;
      3'd2: div_value = RE5_DIV;
      3'd3: div_value = SOL5_DIV;
      3'd4: div_value = DO5_DIV;
      3'd5: div_value = SIB5_DIV;
      default: div_value = 0;
    endcase
  end

  reg [31:0] counter;
  reg [31:0] div_value;
  always @(posedge clk) begin

    if (counter >= div_value) begin
      counter <= 0;
      buzzer  <= ~buzzer;  // Conmutar la salida
    end else begin
      counter <= counter + 1;
    end

    // if (on_off == on_off_melody) begin
    //   if (!power) begin
    //     if (!button_cond) begin
    //       button_cond <= 1'b1;
    //       on_off <= ~on_off;
    //     end
    //   end else begin
    //     button_cond <= 1'b0;
    //   end
    // end

    // if (on_off) begin
    //   if (!play_button) begin
    //     if (!button_cond) begin
    //       button_cond <= 1'b1;
    //       play <= ~play;
    //     end
    //   end else begin
    //     button_cond <= 1'b0;
    //   end
    // end else play <= 1'b0;

  end

  reg clk_1000hz;
  reg [27:0] counter_1000hz = 27'd0;
  localparam DIVISOR_1000hz = 27'd27000;
  always @(posedge clk) begin
    counter_1000hz <= counter_1000hz + 28'd1;
    if (counter_1000hz >= (DIVISOR_1000hz - 1)) counter_1000hz <= 28'd0;
    clk_1000hz <= (counter_1000hz < DIVISOR_1000hz / 2) ? 1'b1 : 1'b0;
  end

endmodule


