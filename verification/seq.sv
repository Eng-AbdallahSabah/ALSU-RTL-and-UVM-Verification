package seq;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  class alsu_seq_item extends uvm_sequence_item;
    `uvm_object_utils(alsu_seq_item)

    // تعريف المتغيرات العشوائية
    rand logic [2:0] A, B, opcode;
    rand logic cin, red_op_A, red_op_B, bypass_A, bypass_B, serial_in, direction;

    // القيود الخاصة بالقيم الصالحة
    constraint valid_constraints {
      opcode inside {[0:5]}; // القيم الصالحة للأوامر (0 إلى 5)
    }

    // دالة البناء
    function new(string name = "alsu_seq_item");
      super.new(name);
    endfunction

    // دالة لتوليد القيم العشوائية
    function void randomize_inputs();
      assert (this.randomize() with { valid_constraints; });
    endfunction
  endclass
endpackage
