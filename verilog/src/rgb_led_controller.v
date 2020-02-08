// Module Name: rgb_led_controller.v
// Author     : Joshua Conner
// Description: RGB LED controller
// Notes      : Change PWM resolution with N parameter and PWM period with
//              PERIOD_CLK_COUNT
//              All three PWM modules share a common resolution and PWM period

module rgb_led_controller 
  # (
    parameter N = 8,
    parameter PERIOD_CLK_COUNT = 2000000)
  (
    input clkIn,
    input rstIn,
    input enIn,
    input [N-1:0] ledRDutyCycleIn,
    input [N-1:0] ledGDutyCycleIn,
    input [N-1:0] ledBDutyCycleIn,
    output ledRPwmOut,
    output ledGPwmOut,
    output ledBPwmOut);

    pwm #(.N(N), .PERIOD_CLK_COUNT(PERIOD_CLK_COUNT)) LED_R (
      .clkIn(clkIn),
      .rstIn(rstIn),
      .enIn(enIn),
      .dutyCycleIn(ledRDutyCycleIn),
      .pwmOut(ledRPwmOut));

    pwm #(.N(N), .PERIOD_CLK_COUNT(PERIOD_CLK_COUNT)) LED_G (
      .clkIn(clkIn),
      .rstIn(rstIn),
      .enIn(enIn),
      .dutyCycleIn(ledGDutyCycleIn),
      .pwmOut(ledGPwmOut));

    pwm #(.N(N), .PERIOD_CLK_COUNT(PERIOD_CLK_COUNT)) LED_B (
      .clkIn(clkIn),
      .rstIn(rstIn),
      .enIn(enIn),
      .dutyCycleIn(ledBDutyCycleIn),
      .pwmOut(ledBPwmOut));

endmodule