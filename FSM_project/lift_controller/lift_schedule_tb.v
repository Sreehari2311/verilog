`timescale 1ns/1ps

module lift_schedule_tb;

    reg        clk, rst;
    reg  [3:0] floor_request;
    reg        door_obstruction, emergency_stop;
    wire [1:0] current_floor;
    wire       door_open, motor_up, motor_down;
    wire [2:0] state_dbg;

    localparam MOVE_TICKS = 2;
    localparam DOOR_TICKS = 2;

    lift_schedule #(
        .FLOORS(4), .MOVE_TICKS(MOVE_TICKS), .DOOR_TICKS(DOOR_TICKS)
    ) dut (
        .clk(clk), .rst(rst),
        .floor_request(floor_request),
        .door_obstruction(door_obstruction),
        .emergency_stop(emergency_stop),
        .current_floor(current_floor),
        .door_open(door_open), .motor_up(motor_up), .motor_down(motor_down),
        .state_dbg(state_dbg)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("WAVEFORM");
        $dumpvars(0, lift_schedule_tb);
    end

    reg [7:0]  pass_count;
    reg [7:0]  fail_count;
    reg [7:0]  test_fail;
    integer    i;

    initial begin
        pass_count = 0;
        fail_count = 0;
        test_fail  = 0;

        $display("=== Lift Scheduling System ===");

        // ------------------------------------------------------------
        // TEST 1: Reset behaviour
        // ------------------------------------------------------------
        
        rst = 1; floor_request = 0; door_obstruction = 0; emergency_stop = 0;
        repeat(3) @(posedge clk); #1;
        rst = 0; // checking with floor request equal to 0, if rst = 1 then full sys freezes
        @(posedge clk); #1;

        
        if (state_dbg == 3'b000) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (current_floor === 2'b00) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (door_open === 1'b0) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (motor_up === 1'b0) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (motor_down === 1'b0) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (test_fail == 0) $display("TEST 1 PASS"); else $display("TEST 1 FAIL");
        test_fail = 0;

        
        // TEST 2: Current floor request (floor 0)
        
        rst = 1; floor_request = 0; door_obstruction = 0; emergency_stop = 0; // rst all values
        repeat(3) @(posedge clk); #1;
        rst = 0;
        @(posedge clk); #1;

        @(negedge clk); floor_request = 4'b0001; emergency_stop = 0;
        repeat(2) @(posedge clk); #1;
        floor_request = 0;

        if (door_open === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (motor_up === 1'b0) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

	if (motor_down === 1'b0) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        repeat(DOOR_TICKS + 1) @(posedge clk); #1; // adding 1 to the closing time for safety margin

        if (state_dbg === 3'b000) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (test_fail == 0) $display("TEST 2 PASS"); else $display("TEST 2 FAIL");
        test_fail = 0;

        
        // TEST 3: Upward service floors 1 and 2
        
        rst = 1; floor_request = 0; door_obstruction = 0; emergency_stop = 0;
        repeat(3) @(posedge clk); #1;
        rst = 0;
        @(posedge clk); #1;

        @(negedge clk); floor_request = 4'b0110; emergency_stop = 0;
        repeat(2) @(posedge clk); #1;
        floor_request = 0;

        if (motor_up === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        repeat(MOVE_TICKS) @(posedge clk); #1;

        if (door_open === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (current_floor === 2'b01) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        @(posedge clk); #1;

        if (motor_up === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        repeat(2) @(posedge clk); #1;

        if (door_open === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (current_floor === 2'b10) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        repeat(DOOR_TICKS + 2) @(posedge clk); #1;

        if (state_dbg === 3'b000) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (test_fail == 0) $display("TEST 3 PASS"); else $display("TEST 3 FAIL");
        test_fail = 0;

        // ------------------------------------------------------------
        // TEST 4: Door obstruction
        // ------------------------------------------------------------
        rst = 1; floor_request = 0; door_obstruction = 0; emergency_stop = 0;
        repeat(3) @(posedge clk); #1;
        rst = 0;
        @(posedge clk); #1;

        @(negedge clk); floor_request = 4'b0001; emergency_stop = 0;
        repeat(2) @(posedge clk); #1;
        floor_request = 0;
        door_obstruction = 1;

        repeat(DOOR_TICKS + 3) @(posedge clk); #1;

        if (door_open === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        door_obstruction = 0;
        repeat(DOOR_TICKS + 1) @(posedge clk); #1;

        if (door_open === 1'b0) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (test_fail == 0) $display("TEST 4 PASS"); else $display("TEST 4 FAIL");
        test_fail = 0;

        // ------------------------------------------------------------
        // TEST 5: Downward service after upward
        // ------------------------------------------------------------
        rst = 1; floor_request = 0; door_obstruction = 0; emergency_stop = 0;
        repeat(3) @(posedge clk); #1;
        rst = 0;
        @(posedge clk); #1;

        @(negedge clk); floor_request = 4'b0100; emergency_stop = 0;
        repeat(2) @(posedge clk); #1;
        floor_request = 0;

        repeat(MOVE_TICKS) @(posedge clk); #1;
        repeat(MOVE_TICKS) @(posedge clk); #1;

        if (door_open === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (current_floor === 2'b10) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        @(negedge clk); floor_request = 4'b0001; emergency_stop = 0;
        @(posedge clk); #1;
        floor_request = 0;

        repeat(DOOR_TICKS + 1) @(posedge clk); #1;

        if (motor_down === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (test_fail == 0) $display("TEST 5 PASS"); else $display("TEST 5 FAIL");
        test_fail = 0;

        // ------------------------------------------------------------
        // TEST 6: Emergency from IDLE
        // ------------------------------------------------------------
        rst = 1; floor_request = 0; door_obstruction = 0; emergency_stop = 0;
        repeat(3) @(posedge clk); #1;
        rst = 0;
        @(posedge clk); #1;

        @(negedge clk); floor_request = 0; emergency_stop = 1;
        repeat(2) @(posedge clk); #1;

        if (door_open === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (motor_up === 1'b0) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (motor_down === 1'b0) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (state_dbg === 3'b101) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        @(negedge clk); emergency_stop = 0;
        repeat(2) @(posedge clk); #1;

        if (state_dbg === 3'b000) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (test_fail == 0) $display("TEST 6 PASS"); else $display("TEST 6 FAIL");
        test_fail = 0;

        // ------------------------------------------------------------
        // TEST 7: Emergency mid-travel
        // ------------------------------------------------------------
        rst = 1; floor_request = 0; door_obstruction = 0; emergency_stop = 0;
        repeat(3) @(posedge clk); #1;
        rst = 0;
        @(posedge clk); #1;

        @(negedge clk); floor_request = 4'b0100; emergency_stop = 0;
        repeat(2) @(posedge clk); #1;
        floor_request = 0;

        if (motor_up === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        @(negedge clk); floor_request = 0; emergency_stop = 1;
        repeat(2) @(posedge clk); #1;

        if (state_dbg === 3'b100) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (door_open === 1'b0) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        repeat(MOVE_TICKS) @(posedge clk); #1;

        if (state_dbg === 3'b101) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (door_open === 1'b1) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        @(negedge clk); emergency_stop = 0;
        repeat(6) @(posedge clk); #1;

        if (state_dbg === 3'b000) pass_count = pass_count + 1;
        else begin fail_count = fail_count + 1; test_fail = test_fail + 1; end

        if (test_fail == 0) $display("TEST 7 PASS"); else $display("TEST 7 FAIL");
        test_fail = 0;

        // ------------------------------------------------------------
        // Final summary
        // ------------------------------------------------------------
        $display("==============================");
        if (fail_count == 0)
            $display("SUMMARY: PASS (%0d checks)", pass_count);
        else
            $display("SUMMARY: FAIL (%0d passed, %0d failed)", pass_count, fail_count);
        $display("==============================");
        $finish;
    end

    initial begin
        #200000;
        $display("TIMEOUT");
        $finish;
    end

endmodule