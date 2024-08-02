module fsm (
    input clk,
    keypad_pressed,
    input [4:0] key,
    input [1:0] W_or_L,
    output reg fsm_error = 1'b1,
    output reg [2:0] presente
);

  //PARAMETROS MAQUINA DE ESTADO
  parameter OFF = 3'd0;
  parameter WLCM = 3'd1;
  parameter CH = 3'd2;
  parameter GAME = 3'd3;
  parameter WL = 3'd4;
  parameter PA = 3'd5;

  reg [2:0] futuro;
  reg conmutacion = 1'b0;

  always @(posedge clk) begin
    if (keypad_pressed) begin
      case (key)
        5'd13: begin  //PWRB
          if (!conmutacion) begin
            if (presente != OFF) begin
              presente <= OFF;
              conmutacion <= 1'b1;
            end else begin
              presente <= WLCM;
            end
          end
        end

        5'd10: begin  //STB
          if (!conmutacion) begin
            if (presente == WLCM) begin
              presente <= CH;
              conmutacion <= 1'b1;
            end else if (presente == CH) presente <= GAME;
          end
        end

        5'd15: begin  //YES
          if (!conmutacion) begin
            if (presente == PA) begin
              presente <= GAME;
              conmutacion <= 1'b1;
            end
          end
        end

        5'd14: begin  //NO
          if (!conmutacion) begin
            if (presente == PA) begin
              presente <= WLCM;
              conmutacion <= 1'b1;
            end
          end
        end
        default: begin
          //nada    
        end
      endcase
    end else begin
      presente <= futuro;
      conmutacion <= 1'b0;
    end


  end

  always @(presente, W_or_L, TIMER_WL) begin
    futuro = presente;
    ///////////////////////////////////////////////////

    ///////////////////////////////////////////////////

    case (presente)
      //   OFF: begin
      //     presente = futuro;
      //   end

      //   WLCM: begin
      //     presente = futuro;
      //   end

      //   CH: begin
      //     presente = futuro;
      //   end

      GAME: begin
        case (W_or_L)
          2'b01: begin
            futuro = WL;
          end
          2'b10: begin
            futuro = WL;
          end
          default: futuro = GAME;
        endcase
      end

      WL: begin
        case (W_or_L)
          2'b01:   if (TIMER_WL == 4'd10) futuro = PA;  //timer para LOST
          2'b10:   if (TIMER_WL == 4'd10) futuro = PA;  //timer para WIN
          default: futuro = WL;
        endcase
      end

      //   PA: begin
      //     presente = futuro;
      //   end

      default: begin
        //fsm_error = 1'b0;
      end
    endcase
  end

  reg clk_WL;
  reg [3:0] TIMER_WL = 4'd0;
  always @(posedge clk_WL) begin
    if (presente == WL) begin
      if (W_or_L == 2'b01 || W_or_L == 2'b10) begin
        TIMER_WL <= TIMER_WL + 4'd1;
      end else begin
        TIMER_WL <= 4'd0;
      end
    end
  end

  reg [27:0] counter_WL = 28'd0;
  parameter DIVISOR_WL = 28'd27000000;
  always @(posedge clk) begin
    counter_WL <= counter_WL + 28'd1;
    if (counter_WL >= (DIVISOR_WL - 1)) counter_WL <= 28'd0;
    clk_WL <= (counter_WL < DIVISOR_WL / 2) ? 1'b1 : 1'b0;
  end
endmodule
