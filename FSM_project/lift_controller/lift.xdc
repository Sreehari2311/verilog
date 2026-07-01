# Clock signal (100 MHz)
set_property -dict { PACKAGE_PIN N11 IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -period 10.000 -name sys_clk [get_ports clk]

# Reset - Push Button Top
set_property -dict { PACKAGE_PIN K13 IOSTANDARD LVCMOS33 PULLDOWN true } [get_ports { rst }];

# Emergency Stop - Push Button Center
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 PULLDOWN true } [get_ports { emergency_stop }];

# Floor Request Switches
set_property -dict { PACKAGE_PIN L5 IOSTANDARD LVCMOS33 } [get_ports { floor_request[0] }];
set_property -dict { PACKAGE_PIN L4 IOSTANDARD LVCMOS33 } [get_ports { floor_request[1] }];
set_property -dict { PACKAGE_PIN M4 IOSTANDARD LVCMOS33 } [get_ports { floor_request[2] }];
set_property -dict { PACKAGE_PIN M2 IOSTANDARD LVCMOS33 } [get_ports { floor_request[3] }];

# Door Obstruction Switch
set_property -dict { PACKAGE_PIN M1 IOSTANDARD LVCMOS33 } [get_ports { door_obstruction }];

# Output LEDs
set_property -dict { PACKAGE_PIN J3 IOSTANDARD LVCMOS33 } [get_ports { door_open }];
set_property -dict { PACKAGE_PIN H3 IOSTANDARD LVCMOS33 } [get_ports { motor_up }];
set_property -dict { PACKAGE_PIN J1 IOSTANDARD LVCMOS33 } [get_ports { motor_down }];
set_property -dict { PACKAGE_PIN K5 IOSTANDARD LVCMOS33 } [get_ports { current_floor[0] }];
set_property -dict { PACKAGE_PIN P6 IOSTANDARD LVCMOS33 } [get_ports { current_floor[1] }];
set_property -dict { PACKAGE_PIN R5 IOSTANDARD LVCMOS33 } [get_ports { state_dbg[0] }];
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports { state_dbg[1] }];
set_property -dict { PACKAGE_PIN T9 IOSTANDARD LVCMOS33 } [get_ports { state_dbg[2] }];

