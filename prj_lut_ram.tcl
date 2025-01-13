set PATH ./
set PROJECT lut_ram

if { [info exists LAN] } {
  set LANGUAGE $LAN
} else {
  set LANGUAGE vhdl
}

create_project -force ${PROJECT}_${LANGUAGE} $PATH/vivado/$PROJECT -part xck26-sfvc784-2LVI-i
set_property board_part xilinx.com:k26i:part0:1.4 [current_project]
set_property target_language $LANGUAGE [current_project]

if {$LANGUAGE == "vhdl"} {
  add_files -norecurse $PATH/vhdl/lut_ram.vhd
  add_files -fileset sim_1 -norecurse $PATH/vhdl/tb_lut_ram.vhd
} elseif {$LANGUAGE == "verilog"} {
  add_files -norecurse $PATH/verilog/lut_ram.v
  add_files -fileset sim_1 -norecurse $PATH/verilog/tb_lut_ram.v
}

set_property generic [list BLOCK_WIDTH=1 ADDR_WIDTH=8 DATA_WIDTH=8] [get_fileset sources_1]
set_property generic [list BLOCK_WIDTH=1 ADDR_WIDTH=8 DATA_WIDTH=8] [get_fileset sim_1]

launch_runs impl_1 -jobs 16
