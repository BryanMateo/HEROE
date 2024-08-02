module choose_hero (
    input clk,
    keypad_pressed,
    input [4:0] key,
    input [2:0] presente,
    output reg [2:0] tipo_h,
    output reg [1:0] var_h
);

  parameter OFF = 3'd0;
  parameter WLCM = 3'd1;
  parameter CH = 3'd2;
  parameter GAME = 3'd3;
  parameter WL = 3'd4;
  parameter PA = 3'd5;

  reg conmutacion = 1'b0;

  always @(posedge clk) begin
    ////////////////////////////////////////////
    if (keypad_pressed) begin
      case (key)
        5'd4: begin  // sel izq
          if (!conmutacion) begin
            if (presente == CH) begin
              if (tipo_h != 3'd0) tipo_h <= tipo_h - 1'd1;
              conmutacion <= 1'b1;
            end
          end
        end

        5'd6: begin  // sel der
          if (!conmutacion) begin
            if (presente == CH) begin
              if (tipo_h != 3'd4) tipo_h <= tipo_h + 1'd1;
              conmutacion <= 1'b1;
            end
          end
        end

        5'd8: begin  // volar
          if (!conmutacion) begin
            if (presente == GAME) begin
              //   if (var_h == 3'd0) 
              var_h <= 2'd2;
              conmutacion <= 1'b1;
            end
          end
        end

        5'd0: begin  // agacharse
          if (!conmutacion) begin
            if (presente == GAME) begin
              //   if (var_h != 3'd4) 
              var_h <= 2'd3;
              conmutacion <= 1'b1;
            end
          end
        end

        5'd9: begin  // saltar
          if (!conmutacion) begin
            if (presente == GAME) begin
              //   if (var_h != 3'd4) 
              var_h <= 2'd1;
              conmutacion <= 1'b1;
            end
          end
        end

        default: begin
          if (tipo_h > 3'd4) tipo_h <= 3'd0;
        end
      endcase
    end else begin
      conmutacion <= 1'b0;
      if (var_h != 2'd0) begin
        var_h <= 2'd0;
      end
    end
    ////////////////////////////////////////////



  end

endmodule
