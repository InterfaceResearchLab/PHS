#set_property PACKAGE_PIN M9 [get_ports clk]

# clock pin
set_property -dict {PACKAGE_PIN M9 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 83.333 -name sys_clk_pin -waveform {0.000 41.667} [get_ports clk]

## USB UART
## Note: Port names are from the perspoctive of the FPGA.
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports rx]
set_property -dict {PACKAGE_PIN L12 IOSTANDARD LVCMOS33} [get_ports tx]


create_pblock pblock_A
add_cells_to_pblock [get_pblocks pblock_A] [get_cells -quiet [list A]]
