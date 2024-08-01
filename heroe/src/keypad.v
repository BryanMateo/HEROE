module keypad (
    input clk,
    input [3:0] columna,
    output reg [3:0] fila,
    output reg [4:0] key,
    output reg keypad_pressed
);
  reg clk_key;
  reg [27:0] counter_key = 28'd0;
  parameter DIVISOR_key = 28'd27000;
  always @(posedge clk) begin
    counter_key <= counter_key + 28'd1;
    if (counter_key >= (DIVISOR_key - 1)) counter_key <= 28'd0;
    clk_key <= (counter_key < DIVISOR_key / 2) ? 1'b1 : 1'b0;
  end

  //barrido de filas
  ///////////////////////////////////////////////////
  reg [1:0] cont = 2'd0;

  always @(posedge clk_key) begin
    case (cont)
      2'd0: fila <= 4'b1000;
      2'd1: fila <= 4'b0100;
      2'd2: fila <= 4'b0010;
      2'd3: fila <= 4'b0001;
    endcase
    cont <= cont + 2'd1;
  end
  ///////////////////////////////////////////////////

  //comparacion de filas y columnas
  ///////////////////////////////////////////////////
  reg [1:0] cycles_count = 2'd0;

  always @(posedge clk_key) begin

    if (cycles_count == 2'd0) begin
      case (columna)
        4'b1000:
        case (fila)
          4'b1000: key = 5'd1;  //1
          4'b0100: key = 5'd4;  //4
          4'b0010: key = 5'd7;  //7
          4'b0001: key = 5'd15;  //*                
        endcase
        4'b0100:
        case (fila)
          4'b1000: key = 5'd2;  //2
          4'b0100: key = 5'd5;  //5
          4'b0010: key = 5'd8;  //8
          4'b0001: key = 5'd0;  //0                
        endcase
        4'b0010:
        case (fila)
          4'b1000: key = 5'd3;  //3
          4'b0100: key = 5'd6;  //6
          4'b0010: key = 5'd9;  //9
          4'b0001: key = 5'd14;  //#                
        endcase
        4'b0001:
        case (fila)
          4'b1000: key = 5'd10;  //A
          4'b0100: key = 5'd11;  //B
          4'b0010: key = 5'd12;  //C
          4'b0001: key = 5'd13;  //D                
        endcase
        default key = 5'd31;  // ninguna
      endcase
    end

    if (key >= 5'd0 && key <= 5'd15) begin
      if (cycles_count < 2'd3) begin
        cycles_count   <= cycles_count + 2'd1;
        keypad_pressed <= 1'b1;
      end else cycles_count <= 2'd0;
    end else keypad_pressed <= 1'b0;
  end

  ///////////////////////////////////////////////////
endmodule
