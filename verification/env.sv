package alsu_env_pkg;
  import uvm_pkg::*;
  import alsu_driver_pkg::*;
  import alsu_coverage_pkg::*;
  `include "uvm_macros.svh"

  class alsu_env extends uvm_env;
    `uvm_component_utils(alsu_env)

    alsu_driver driver;
    alsu_coverage coverage;

    function new(string name = "alsu_env", uvm_component parent = null);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      driver = alsu_driver::type_id::create("driver", this);
      coverage = alsu_coverage::type_id::create("coverage", this);
    endfunction
  endclass
endpackage
