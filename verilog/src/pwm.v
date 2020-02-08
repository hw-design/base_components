// Module Name: pwm.v
// Author     : Joshua Conner
// Description: Creates a single PWM signal
// Notes      : Change PWM resolution with N parameter and PWM period with
//              PERIOD_CLK_COUNT

module pwm 
  #(
    parameter N = 8,
    parameter PERIOD_CLK_COUNT = 2000000) //2000000*10ns=20ms
  (
    input clkIn,
    input rstIn,
    input enIn,
    input [N-1:0] dutyCycleIn,
    output reg pwmOut);

    integer dutyCycleCnt;

  always @ (posedge clkIn) begin
    if (rstIn == 1'b1) begin
      dutyCycleCnt <= 1'b0;
    end 
    else begin
      if (enIn == 1'b1) begin
        if (dutyCycleCnt < PERIOD_CLK_COUNT-1) begin
          dutyCycleCnt = dutyCycleCnt + 1;
        end
        else begin
          dutyCycleCnt = 0;
        end
      end
    end
  end

  always @ (posedge clkIn) begin
    if (rstIn == 1'b1) begin
      pwmOut <= 1'b0;
    end
    else begin
      if (enIn == 1'b1) begin
        pwmOut = (dutyCycleCnt < (dutyCycleIn * (PERIOD_CLK_COUNT >> N))) ? 1'b1 : 1'b0;
      end
      else begin
        pwmOut = 1'b0;
      end
    end
  end
endmodule