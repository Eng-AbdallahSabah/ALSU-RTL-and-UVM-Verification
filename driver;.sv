package alsu_driver_pkg;
  import uvm_pkg::*;
  import alsu_config_pkg::*;
  `include "uvm_macros.svh"

  class alsu_driver extends uvm_driver;
    `uvm_component_utils(alsu_driver)
    virtual alsu_if alsu_vif;
    alsu_config alsu_cfg;

    function new(string name = "alsu_driver", uvm_component parent = null);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if (!uvm_config_db#(alsu_config)::get(this, "", "CFG", alsu_cfg)) begin
        `uvm_fatal("NO_CONFIG", "Configuration object not found");
      end
    endfunction

    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      alsu_vif = alsu_cfg.alsu_vif;
    endfunction

    task run_phase(uvm_phase phase);
      super.run_phase(phase);
      @(negedge alsu_vif.clk);
      alsu_vif.A = 0;
      alsu_vif.B = 0;
      alsu_vif.cin = 0;
      alsu_vif.red_op_A = 0;
      alsu_vif.red_op_B = 0;
      alsu_vif.bypass_A = 0;
      alsu_vif.bypass_B = 0;
      alsu_vif.opcode = 0;
      alsu_vif.serial_in = 0;
      alsu_vif.direction = 0;
      alsu_vif.rst = 1;
      #20;
      alsu_vif.rst = 0;
      
      forever begin
        @(negedge alsu_vif.clk);
        alsu_vif.A = $random;
        alsu_vif.B = $random;
        alsu_vif.cin = $random;
        alsu_vif.red_op_A = $random;
        alsu_vif.red_op_B = $random;
        alsu_vif.bypass_A = $random;
        alsu_vif.bypass_B = $random;
        alsu_vif.opcode = $random;
        alsu_vif.serial_in = $random;
        alsu_vif.direction = $random;
      end
    endtask
  endclass
endpackage
