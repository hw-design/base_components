module pwm 
  #(
    parameter N = 8,
    parameter PERIOD_CLK_COUNT = 2000000) //2000000*10ns=20ms
  (
    input i_clk,
    input i_rst,
    input i_en,
    input [N-1:0] i_dutyCycle,
    output reg o_pwm);

    integer dutyCycleCnt;

  always @ (posedge i_clk) begin
    if (i_rst == 1'b1) begin
      dutyCycleCnt <= 1'b0;
    end 
    else begin
      if (i_en == 1'b1) begin
        if (dutyCycleCnt < PERIOD_CLK_COUNT-1) begin
          dutyCycleCnt = dutyCycleCnt + 1;
        end
        else begin
          dutyCycleCnt = 0;
        end
      end
    end
  end

  always @ (posedge i_clk) begin
    if (i_rst == 1'b1) begin
      o_pwm <= 1'b0;
    end
    else begin
      if (i_en == 1'b1) begin
        o_pwm = (dutyCycleCnt < (i_dutyCycle * (PERIOD_CLK_COUNT >> N))) ? 1'b1 : 1'b0;
      end
      else begin
        o_pwm = 1'b0;
      end
    end
  end
endmodule