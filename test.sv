package alsu_test_pkg;
  import uvm_pkg::*;
  import alsu_env_pkg::*;
  import alsu_config_pkg::*;
  `include "uvm_macros.svh"

  class alsu_test extends uvm_test;
    `uvm_component_utils(alsu_test)

    alsu_config alsu_cfg;
    alsu_env env;

    function new(string name = "alsu_test", uvm_component parent = null);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env = alsu_env::type_id::create("env", this);
      alsu_cfg = alsu_config::type_id::create("alsu_cfg", this);
      if (!uvm_config_db#(virtual alsu_if)::get(this, "", "ALSU_IF", alsu_cfg.alsu_vif))
        `uvm_fatal("NO_VIF", "Virtual interface not found");
      uvm_config_db#(alsu_config)::set(this, "*", "CFG", alsu_cfg);
    endfunction

    task run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this);
      #100;
      `uvm_info("run_phase", "Inside the ALSU test", UVM_MEDIUM);
      phase.drop_objection(this);
    endtask
  endclass
endpackage
