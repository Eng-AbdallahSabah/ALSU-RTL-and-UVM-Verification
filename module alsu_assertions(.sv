// Assertions module
module alsu_assertions(
  input  logic        clk,
  input  logic [15:0] leds,
  input  logic signed [5:0] out,
  input  logic        invalid
);
  // 1) المخرجات مايبقاش فيها X/Z
  property p_no_x_out;
    @(posedge clk) !$isunknown(out);
  endproperty
  assert property (p_no_x_out)
    else $error("ASSERT: out has X/Z");

  // 2) لما الـ invalid يبقى 0، الـ LEDs لازم تفضل 0
  property p_leds_zero_when_not_invalid;
    @(posedge clk) (!invalid) |-> (leds == 16'h0000);
  endproperty
  assert property (p_leds_zero_when_not_invalid)
    else $error("ASSERT: leds != 0 while invalid == 0");

  // 3) لما الـ invalid يبقى 1، نتوقع الـ LEDs تتغيّر (تعمل blink) عن الدورة اللي فاتت
  property p_leds_toggle_when_invalid;
    @(posedge clk) invalid |=> (leds != $past(leds));
  endproperty
  assert property (p_leds_toggle_when_invalid)
    else $warning("ASSERT: leds did not toggle while invalid == 1");
endmodule

// Bind على كل إنستانس من ALSU
// ملاحظة: الأسماء داخل البايند (.clk, .leds, .out, .invalid) لازم تطابق إشارات الـ ALSU نفسه
bind ALSU alsu_assertions u_alsu_assertions (
  .clk     (clk),
  .leds    (leds),
  .out     (out),
  .invalid (invalid)
);
