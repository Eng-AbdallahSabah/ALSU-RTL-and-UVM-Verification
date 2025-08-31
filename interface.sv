interface alsu_if(input logic clk);
  logic rst;
  logic signed [2:0] A, B, opcode;
  logic cin, red_op_A, red_op_B, bypass_A, bypass_B, serial_in, direction;
  logic [15:0] leds;
  logic signed [5:0] out;
endinterface
