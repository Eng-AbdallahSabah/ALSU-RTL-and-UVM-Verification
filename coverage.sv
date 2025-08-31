package alsu_coverage_pkg;
  logic [7:0] A,B;
  logic [5:0] opcode; 
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  class alsu_coverage extends uvm_component;
    `uvm_component_utils(alsu_coverage)

    covergroup cg;
      coverpoint A {bins A_bins[] = {[0:7]};} // تغطية جميع القيم الممكنة لـ A
      coverpoint B {bins B_bins[] = {[0:7]};} // تغطية جميع القيم الممكنة لـ B
      coverpoint opcode {bins opcode_bins[] = {[0:5]};} // تغطية كل الأوامر
    endgroup

    function new(string name = "alsu_coverage", uvm_component parent = null);
      super.new(name, parent);
      cg = new();
    endfunction

    // رصد إشارات المدخلات و تسجيلها في التغطية
    function void start();
      cg.start();
    endfunction
  endclass
endpackage
