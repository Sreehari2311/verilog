`timescale 1ns/1ps
module lift_top (
    input  wire        clk,
    input  wire        rst,
    input  wire        emergency_stop,
    input  wire [3:0]  floor_request,
    input  wire        door_obstruction,
    output wire        door_open,
    output wire        motor_up,
    output wire        motor_down,
    output wire [2:0]  state_dbg,
    // 7-segment display outputs (current_floor now shown on 7-seg, not LEDs)
    output wire [3:0]  digit,       // digit enables, active-HIGH
    output wire [7:0]  Seven_Seg    // segment drives, active-LOW
);

    wire clk_1hz;
    wire rst_db;
    wire emg_db;
    wire [3:0] fr_db;
    wire dob_db;
    wire [1:0] current_floor;      // internal wire from FSM to 7-seg driver

    // -------------------------------------------------------------------------
    // Clock divider
    // -------------------------------------------------------------------------
    clk_divider u_clk_div (
        .clk_100mhz (clk),
        .rst        (rst),
        .clk_1hz    (clk_1hz)
    );

    // -------------------------------------------------------------------------
    // Debouncers
    // -------------------------------------------------------------------------
    // rst debouncer: its own rst port tied to 0 — can't reset itself
    debouncer u_db_rst (
        .clk_100mhz (clk),
        .rst        (1'b0),
        .raw_in     (rst),
        .db_out     (rst_db)
    );

    debouncer u_db_emg (
        .clk_100mhz (clk),
        .rst        (rst_db),
        .raw_in     (emergency_stop),
        .db_out     (emg_db)
    );

    genvar g;
    generate
        for (g = 0; g < 4; g = g + 1) begin : gen_fr_db
            debouncer u_db_fr (
                .clk_100mhz (clk),
                .rst        (rst_db),
                .raw_in     (floor_request[g]),
                .db_out     (fr_db[g])
            );
        end
    endgenerate

    debouncer u_db_dob (
        .clk_100mhz (clk),
        .rst        (rst_db),
        .raw_in     (door_obstruction),
        .db_out     (dob_db)
    );

    // -------------------------------------------------------------------------
    // FSM
    // -------------------------------------------------------------------------
    lift_schedule #(
        .FLOORS     (4),
        .MOVE_TICKS (2),
        .DOOR_TICKS (2)
    ) u_lift (
        .clk              (clk_1hz),
        .rst              (rst_db),
        .floor_request    (fr_db),
        .door_obstruction (dob_db),
        .emergency_stop   (emg_db),
        .current_floor    (current_floor),
        .door_open        (door_open),
        .motor_up         (motor_up),
        .motor_down       (motor_down),
        .state_dbg        (state_dbg)
    );

    // -------------------------------------------------------------------------
    // 7-segment display driver
    // -------------------------------------------------------------------------
    seg7_display u_seg7 (
        .current_floor (current_floor),
        .digit         (digit),
        .Seven_Seg     (Seven_Seg)
    );

endmodule
