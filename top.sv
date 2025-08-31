`include "uvm_macros.svh"
import uvm_pkg::*;
import alsu_test_pkg::*;

module top;
  bit clk;
  // واجهة الـ DUT
  alsu_if alsu_vif (clk);

  // DUT
  ALSU DUT (
    .A         (alsu_vif.A),
    .B         (alsu_vif.B),
    .cin       (alsu_vif.cin),
    .serial_in (alsu_vif.serial_in),
    .red_op_A  (alsu_vif.red_op_A),
    .red_op_B  (alsu_vif.red_op_B),
    .opcode    (alsu_vif.opcode),
    .bypass_A  (alsu_vif.bypass_A),
    .bypass_B  (alsu_vif.bypass_B),
    .clk       (alsu_vif.clk),
    .rst       (alsu_vif.rst),
    .direction (alsu_vif.direction),
    .leds      (alsu_vif.leds),
    .out       (alsu_vif.out)
  );

  // Clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset على الـ interface (مش متغيّر محلي منفصل)
  initial begin
    alsu_vif.rst = 1;
    #20 alsu_vif.rst = 0;
  end

  // UVM
  initial begin
    // استخدم مسار واسع عشان يوصل لأي كومبوننت محتاج الـ VIF
    uvm_config_db#(virtual alsu_if)::set(null, "*", "ALSU_IF", alsu_vif);
    run_test("alsu_test");
  end
endmodule
