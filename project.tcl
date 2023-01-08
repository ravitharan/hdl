set PATH ./
set PROJECT simple

create_project -force project_1 $PATH/$PROJECT -part xck26-sfvc784-2LVI-i
set_property board_part xilinx.com:k26i:part0:1.4 [current_project]
set_property target_language VHDL [current_project]

add_files -norecurse $PATH/incdec.vhd
add_files -fileset sim_1 -norecurse $PATH/tb_incdec.vhd

launch_runs impl_1 -jobs 16
