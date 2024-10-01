set PATH ./
set PROJECT compare

if { [info exists LAN] } {
  set LANGUAGE $LAN
} else {
  set LANGUAGE vhdl
}

create_project -force ${PROJECT}_${LANGUAGE} $PATH/$PROJECT -part xck26-sfvc784-2LVI-i
set_property board_part xilinx.com:k26i:part0:1.4 [current_project]
set_property target_language VHDL [current_project]

if {$LANGUAGE == "vhdl"} {
  add_files -norecurse $PATH/compare.vhd
  add_files -fileset sim_1 -norecurse $PATH/tb_compare.vhd
} elseif {$LANGUAGE == "verilog"} {
  add_files -norecurse $PATH/compare.v
  add_files -fileset sim_1 -norecurse $PATH/tb_compare.v
}

launch_runs impl_1 -jobs 16
