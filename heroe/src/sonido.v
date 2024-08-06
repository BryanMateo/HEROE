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
    output reg buzzer,
    buzzer1
);

  reg [8:0] cont_keypad_pressed = 9'd0;
  reg cont_cond = 1'b0;
  reg condicion = 1'b0;

  always @(posedge clk_1000hz) begin
    if (presente != OFF) begin
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
          nota <= 3'd0;
          cont_cond <= 1'b0;
          cont_keypad_pressed <= 9'd0;
        end
      end
    end else begin
      nota <= 3'd0;
      cont_cond <= 1'b0;
      cont_keypad_pressed <= 9'd0;
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
    case (nota_1)
      3'd1: div_value1 = FA5_DIV;
      3'd2: div_value1 = RE5_DIV;
      3'd3: div_value1 = SOL5_DIV;
      3'd4: div_value1 = DO5_DIV;
      3'd5: div_value1 = SIB5_DIV;
      default: div_value1 = 0;
    endcase
  end

  reg [31:0] counter, counter1;
  reg [31:0] div_value, div_value1;
  always @(posedge clk) begin

    if (counter >= div_value) begin
      counter <= 0;
      buzzer  <= ~buzzer;  // Conmutar la salida
    end else begin
      counter <= counter + 1;
    end

    if (counter1 >= div_value1) begin
      counter1 <= 0;
      buzzer1  <= ~buzzer1;  // Conmutar la salida
    end else begin
      counter1 <= counter1 + 1;
    end

  end

  reg clk_1000hz;
  reg [27:0] counter_1000hz = 27'd0;
  localparam DIVISOR_1000hz = 27'd27000;
  always @(posedge clk) begin
    counter_1000hz <= counter_1000hz + 28'd1;
    if (counter_1000hz >= (DIVISOR_1000hz - 1)) counter_1000hz <= 28'd0;
    clk_1000hz <= (counter_1000hz < DIVISOR_1000hz / 2) ? 1'b1 : 1'b0;
  end

  reg [2:0] nota_1;
  reg [5:0] sel;
  always @(posedge bpm) begin

    if (presente == GAME) begin
      if (sel == 6'd37) begin
        sel <= 6'd0;
      end else begin
        sel <= sel + 1'b1;
      end
      case (sel)
        6'd0:  nota_1 <= FA;
        6'd1:  nota_1 <= 3'd0;
        6'd2:  nota_1 <= FA;
        6'd3:  nota_1 <= 3'd0;
        6'd4:  nota_1 <= RE;
        6'd5:  nota_1 <= FA;
        6'd6:  nota_1 <= SOL;
        6'd7:  nota_1 <= DO;
        6'd8:  nota_1 <= RE;
        6'd9:  nota_1 <= RE;
        6'd10: nota_1 <= 3'd0;
        6'd11: nota_1 <= FA;
        6'd12: nota_1 <= 3'd0;
        6'd13: nota_1 <= FA;
        6'd14: nota_1 <= 3'd0;
        6'd15: nota_1 <= RE;
        6'd16: nota_1 <= FA;
        6'd17: nota_1 <= SOL;
        6'd18: nota_1 <= DO;
        6'd19: nota_1 <= RE;
        6'd20: nota_1 <= RE;
        6'd21: nota_1 <= 3'd0;
        6'd22: nota_1 <= SIB;
        6'd23: nota_1 <= SOL;
        6'd24: nota_1 <= FA;
        6'd25: nota_1 <= RE;
        6'd26: nota_1 <= SIB;
        6'd27: nota_1 <= SOL;
        6'd28: nota_1 <= FA;
        6'd29: nota_1 <= RE;
        6'd30: nota_1 <= FA;
        6'd31: nota_1 <= FA;
        6'd32: nota_1 <= FA;
        6'd33: nota_1 <= FA;
        6'd34: nota_1 <= 3'd0;
        6'd35: nota_1 <= SOL;
        6'd36: nota_1 <= RE;
        default: begin
          nota_1 <= 3'd0;
        end
      endcase
    end else begin
      sel <= 6'd0;
      nota_1 <= 3'd0;
    end
  end

  reg bpm;
  reg [27:0] counterbpm = 2;
  localparam DIVISORbpm = 28'd8200000;
  always @(posedge clk) begin
    counterbpm <= counterbpm + 28'd1;
    if (counterbpm >= (DIVISORbpm - 1)) counterbpm <= 2;
    bpm <= (counterbpm < DIVISORbpm / 2) ? 1'b1 : 1'b0;
  end

endmodule


