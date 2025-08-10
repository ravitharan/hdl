set PROJECT division
set PROJECT_PATH ./testbench/$PROJECT/$PROJECT
set TB_SRC ./testbench/$PROJECT/tb.sv
set TOP_MODULE tb_division_wrapper 

create_project -force $PROJECT $PROJECT_PATH -part xck26-sfvc784-2LVI-i
set_property board_part xilinx.com:k26i:part0:1.4 [current_project]

create_bd_design $PROJECT

create_bd_cell -type ip -vlnv xilinx.com:ip:div_gen:5.1 div_gen_0
set_property -dict [list \
    CONFIG.dividend_and_quotient_width.VALUE_SRC USER \
    CONFIG.divisor_width.VALUE_SRC USER \
    CONFIG.dividend_and_quotient_width {48} \
    CONFIG.divisor_width {20} \
    CONFIG.fractional_width {20} \
    CONFIG.latency {52} \
    CONFIG.remainder_type {Remainder} \
] [get_bd_cells div_gen_0]

create_bd_port -dir I -from 23 -to 0 s_axis_divisor_tdata
create_bd_port -dir I -from 47 -to 0 s_axis_dividend_tdata
create_bd_port -dir I s_axis_dividend_tvalid
create_bd_port -dir I s_axis_divisor_tvalid
create_bd_port -dir I -type clk -freq_hz 1000000 aclk
create_bd_port -dir O -from 71 -to 0 m_axis_dout_tdata
create_bd_port -dir O m_axis_dout_tvalid

connect_bd_net [get_bd_pins /div_gen_0/aclk] [get_bd_ports aclk]
connect_bd_net [get_bd_pins /div_gen_0/m_axis_dout_tdata] [get_bd_ports m_axis_dout_tdata]
connect_bd_net [get_bd_pins /div_gen_0/m_axis_dout_tvalid] [get_bd_ports m_axis_dout_tvalid]
connect_bd_net [get_bd_pins /div_gen_0/s_axis_dividend_tdata] [get_bd_ports s_axis_dividend_tdata]
connect_bd_net [get_bd_pins /div_gen_0/s_axis_dividend_tvalid] [get_bd_ports s_axis_dividend_tvalid]
connect_bd_net [get_bd_pins /div_gen_0/s_axis_divisor_tdata] [get_bd_ports s_axis_divisor_tdata]
connect_bd_net [get_bd_pins /div_gen_0/s_axis_divisor_tvalid] [get_bd_ports s_axis_divisor_tvalid]

make_wrapper -files [get_files $PROJECT_PATH/$PROJECT.srcs/sources_1/bd/$PROJECT/$PROJECT.bd] -top
add_files -norecurse ${PROJECT_PATH}/${PROJECT}.gen/sources_1/bd/$PROJECT/hdl/${PROJECT}_wrapper.v
regenerate_bd_layout
    
set_property SOURCE_SET sources_1 [get_filesets sim_1]
add_files -fileset sim_1 -norecurse ${TB_SRC}

set_property top $TOP_MODULE [get_filesets sim_1]

