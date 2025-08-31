package alsu_pkg;
  // Enumeration for opcode with invalid cases
  typedef enum logic [2:0] {
    XOR = 3'h1,
    OR = 3'h0,
    ADD = 3'h2,
    MULT = 3'h3,
    SHIFT = 3'h4,
    ROTATE = 3'h5,
    INVALID_6 = 3'h6,
    INVALID_7 = 3'h7
  } opcode_e;

  // Class for randomizing inputs with constraints
class alsu_input;
  rand logic rst, red_op_A, red_op_B, bypass_A, bypass_B, direction;
  rand logic [2:0] A, B;
  rand opcode_e opcode;
  rand logic cin, serial_in;

  constraint low_reset_prob { rst dist {0 := 50, 1 := 50}; }  // Allow equal probability for reset

  // Ensure bypass signals toggle
  constraint bypass_constraints {
    bypass_A dist {0 := 50, 1 := 50};  // 50% probability for 0 and 1
    bypass_B dist {0 := 50, 1 := 50};  // 50% probability for 0 and 1
  }

  // Existing constraints for other signals
  constraint frequent_adder_inputs {
    (opcode == ADD || opcode == MULT) -> A inside {3'b111, 3'b000, 3'b100};
    (opcode == ADD || opcode == MULT) -> B inside {3'b111, 3'b000, 3'b100};
  }
  constraint or_xor_conditions {
    (opcode == OR || opcode == XOR && red_op_A) -> A == 3'b001;
    (opcode == OR || opcode == XOR && red_op_B) -> B == 3'b001;
  }
  constraint disable_bypass {bypass_A == 0; bypass_B == 0;}
  constraint invalid_less_frequent {
    opcode dist {
      INVALID_6 := 10,
      INVALID_7 := 10,
      OR := 40,
      XOR := 40,
      ADD := 60,
      MULT := 60,
      SHIFT := 20,
      ROTATE := 20
    };
  }
endclass
endpackage
