module rgb_led_controller 
  # (
    parameter N = 8,
    parameter PERIOD_CLK_COUNT = 2000000)
  (
    input i_clk,
    input i_rst,
    input i_en,
    input [N-1:0] i_ledRDutyCycle,
    input [N-1:0] i_ledGDutyCycle,
    input [N-1:0] i_ledBDutyCycle,
    output o_ledRPwm,
    output o_ledGPwm,
    output o_ledBPwm);

    pwm #(.N(N), .PERIOD_CLK_COUNT(PERIOD_CLK_COUNT)) LED_R (
      .i_clk(i_clk),
      .i_rst(i_rst),
      .i_en(i_en),
      .i_dutyCycle(i_ledRDutyCycle),
      .o_pwm(o_ledRPwm));

    pwm #(.N(N), .PERIOD_CLK_COUNT(PERIOD_CLK_COUNT)) LED_G (
      .i_clk(i_clk),
      .i_rst(i_rst),
      .i_en(i_en),
      .i_dutyCycle(i_ledGDutyCycle),
      .o_pwm(o_ledGPwm));

    pwm #(.N(N), .PERIOD_CLK_COUNT(PERIOD_CLK_COUNT)) LED_B (
      .i_clk(i_clk),
      .i_rst(i_rst),
      .i_en(i_en),
      .i_dutyCycle(i_ledBDutyCycle),
      .o_pwm(o_ledBPwm));

endmodule