#set_property PACKAGE_PIN M9 [get_ports clk]

# clock pin
set_property -dict {PACKAGE_PIN M9 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 83.333 -name sys_clk_pin -waveform {0.000 41.667} [get_ports clk]

## USB UART
## Note: Port names are from the perspoctive of the FPGA.
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports rx]
set_property -dict {PACKAGE_PIN L12 IOSTANDARD LVCMOS33} [get_ports tx]


create_pblock pblock_B
add_cells_to_pblock [get_pblocks pblock_B] [get_cells -quiet [list A]]
resize_pblock [get_pblocks pblock_B] -add {SLICE_X0Y79:SLICE_X41Y27}
resize_pblock [get_pblocks pblock_B] -add {DSP48_X0Y12:DSP48_X1Y31}
resize_pblock [get_pblocks pblock_B] -add {RAMB18_X0Y31:RAMB18_X2Y12}
resize_pblock [get_pblocks pblock_B] -add {RAMB36_X0Y15:RAMB36_X2Y6}

#set_max_delay -from [get_cells signal_reg] -to [get_pins -hierarchical {*tx_data_reg[*]/D*}] 10.000
set_max_delay -from [get_pins *signal_reg/C] -to [get_pins A/A*/DFF/Q_reg/D] 170.000
#report_timing -from [get_pins *signal_reg/C] -to [get_pins A/A*/DFF/Q_reg/D] -delay_type min_max -max_paths 10 -sort_by group -input_pins -routable_nets

