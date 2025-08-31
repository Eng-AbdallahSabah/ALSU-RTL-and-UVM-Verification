module alsu_tb;
  import alsu_pkg::*;  

  logic clk, rst;
  logic [15:0] leds;
  logic [5:0] out;
  logic [2:0] A, B, opcode;
  logic cin, red_op_A, red_op_B, bypass_A, bypass_B, direction, serial_in,bypass_A_reg;
  int error_count;
  int correct_count;
  ALSU dut 
  (  .A(A)
    ,.B(B)
    ,.cin(cin)
    ,.serial_in(serial_in)
    ,.red_op_A(red_op_A)
    ,.red_op_B(red_op_B)
    ,.opcode(opcode) 
    ,.bypass_A(bypass_A) 
    ,.bypass_B(bypass_B)
    ,.clk(clk), .rst(rst)
    ,.direction(direction)
    ,.leds(leds)
    ,.out(out)
  );

  
  initial begin
    clk=0;
  forever
    #1
    clk= ~clk;
  end

  alsu_input tb_inputs;

  initial begin
    tb_inputs = new();
    rst = 1;
    #10;
    rst = 0;    repeat (1000) begin
      assert(tb_inputs.randomize());
      A = tb_inputs.A;
      B = tb_inputs.B;
      opcode = tb_inputs.opcode;
      red_op_A = tb_inputs.red_op_A;
      red_op_B = tb_inputs.red_op_B;
      bypass_A = tb_inputs.bypass_A;
      bypass_B = tb_inputs.bypass_B;
      direction = tb_inputs.direction;
      cin = tb_inputs.cin;
      serial_in = tb_inputs.serial_in;
      rst = tb_inputs.rst;  
      check_result(A, B, opcode, dut.out);
      @(negedge clk);
    end
    $stop;
  end

  task check_result(input logic [2:0] A, B, opcode, output logic [5:0] expected_out);
    case (opcode)
      ADD: expected_out = A + B;
      MULT: expected_out = A * B;
      OR: expected_out = A | B;
      XOR: expected_out = A ^ B;
      default: expected_out = 6'b0;
      endcase
      if (expected_out !== out) begin
         $display ("incorrect result");
           error_count= error_count+1;
        end
      else begin
        $display ("correct result");
         correct_count= correct_count+1;
        end
  endtask

  initial begin
    bypass_A = 0;
    #10;
    bypass_A = 1;
    #10;

    bypass_B = 0;
    #10;
    bypass_B = 1;
    #10;

    bypass_A_reg = 0;
    #10;
    bypass_A_reg = 1;
    #10;

    rst = 0;
    #10;
    rst = 1;
    #10;
    rst = 0;
    #10;
  end
endmodule
