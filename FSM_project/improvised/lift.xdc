# Clock signal (100 MHz)
set_property -dict { PACKAGE_PIN N11 IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -period 20.000 -name sys_clk [get_ports clk]

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

# Output LEDs (door_open, motor_up, motor_down, state_dbg)
set_property -dict { PACKAGE_PIN J3 IOSTANDARD LVCMOS33 } [get_ports { door_open }];
set_property -dict { PACKAGE_PIN H3 IOSTANDARD LVCMOS33 } [get_ports { motor_up }];
set_property -dict { PACKAGE_PIN J1 IOSTANDARD LVCMOS33 } [get_ports { motor_down }];
set_property -dict { PACKAGE_PIN R5 IOSTANDARD LVCMOS33 } [get_ports { state_dbg[0] }];
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports { state_dbg[1] }];
set_property -dict { PACKAGE_PIN T9 IOSTANDARD LVCMOS33 } [get_ports { state_dbg[2] }];

# 7-Segment Display — Digit selects (active-HIGH via NPN transistor)
set_property -dict { PACKAGE_PIN F2 IOSTANDARD LVCMOS33 } [get_ports { digit[0] }]; # rightmost digit (floor display)
set_property -dict { PACKAGE_PIN E1 IOSTANDARD LVCMOS33 } [get_ports { digit[1] }]; # unused, kept LOW
set_property -dict { PACKAGE_PIN G5 IOSTANDARD LVCMOS33 } [get_ports { digit[2] }]; # unused, kept LOW
set_property -dict { PACKAGE_PIN G4 IOSTANDARD LVCMOS33 } [get_ports { digit[3] }]; # unused, kept LOW

# 7-Segment Display — Segment drives (active-LOW)
set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS33 } [get_ports { Seven_Seg[0] }]; # A
set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS33 } [get_ports { Seven_Seg[1] }]; # B
set_property -dict { PACKAGE_PIN H5 IOSTANDARD LVCMOS33 } [get_ports { Seven_Seg[2] }]; # C
set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS33 } [get_ports { Seven_Seg[3] }]; # D
set_property -dict { PACKAGE_PIN J5 IOSTANDARD LVCMOS33 } [get_ports { Seven_Seg[4] }]; # E
set_property -dict { PACKAGE_PIN J4 IOSTANDARD LVCMOS33 } [get_ports { Seven_Seg[5] }]; # F
set_property -dict { PACKAGE_PIN H2 IOSTANDARD LVCMOS33 } [get_ports { Seven_Seg[6] }]; # G
set_property -dict { PACKAGE_PIN H1 IOSTANDARD LVCMOS33 } [get_ports { Seven_Seg[7] }]; # DP (always OFF)
