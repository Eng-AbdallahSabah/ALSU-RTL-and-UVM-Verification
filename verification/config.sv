package alsu_config_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  class alsu_config extends uvm_object;
    `uvm_object_utils(alsu_config)

    // تعريف الواجهة الافتراضية
    virtual alsu_if alsu_vif;

    // دالة البناء
    function new(string name = "alsu_config");
      super.new(name);
    endfunction

    // دالة لضبط الواجهة الافتراضية
    /*function void set_virtual_interface(alsu_if vif);
      alsu_vif = vif;
    endfunction*/
  endclass
endpackage
