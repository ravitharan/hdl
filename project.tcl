set ALL_PROJECTS(0) {compare v v}
set ALL_PROJECTS(1) {compare vhd vhd}
set ALL_PROJECTS(2) {incdec v v}
set ALL_PROJECTS(3) {incdec vhd vhd}
set ALL_PROJECTS(4) {lookup v v}
set ALL_PROJECTS(5) {lookup vhd vhd}
set ALL_PROJECTS(6) {multiply v v}
set ALL_PROJECTS(7) {multiply vhd vhd}
set ALL_PROJECTS(8) {lut_ram v v}
set ALL_PROJECTS(9) {compare_2 v v}
set ALL_PROJECTS(10) {compare_3 v v}
set ALL_PROJECTS(11) {edge sv sv}

set PROJECT [lindex $ALL_PROJECTS($inx) 0]
set EXT [lindex $ALL_PROJECTS($inx) 1]
set TB_EXT [lindex $ALL_PROJECTS($inx) 2]

if {$EXT == "v"} {
  set LANGUAGE verilog
} elseif {$EXT == "vhd"} {
  set LANGUAGE vhdl
} elseif {$EXT == "sv"} {
  set LANGUAGE systemverilog
}

set SRC ./$LANGUAGE/$PROJECT/$PROJECT.$EXT
set TB_SRC ./$LANGUAGE/$PROJECT/tb_$PROJECT.$TB_EXT

create_project -force ${PROJECT} ./$LANGUAGE/$PROJECT/$PROJECT -part xck26-sfvc784-2LVI-i
set_property board_part xilinx.com:k26i:part0:1.4 [current_project]
if {$LANGUAGE != "systemverilog"} {
  set_property target_language $LANGUAGE [current_project]
}

add_files -norecurse ${SRC}
add_files -fileset sim_1 -norecurse ${TB_SRC}

launch_runs impl_1 -jobs 16

