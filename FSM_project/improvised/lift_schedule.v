`timescale 1ns/1ps
 
 
module lift_schedule #( parameter FLOORS = 4, parameter MOVE_TICKS = 2, parameter DOOR_TICKS = 2)(
    input  wire              clk,
    input  wire              rst,
    input  wire [FLOORS-1:0] floor_request,
    input  wire              door_obstruction,
    input  wire              emergency_stop,
    output reg  [1:0]        current_floor,
    output reg               door_open,
    output reg               motor_up,
    output reg               motor_down,
    output wire [2:0]        state_dbg
);
    localparam S_IDLE             = 3'b000;
    localparam S_DOOR_OPEN        = 3'b001;
    localparam S_MOVE_UP          = 3'b010;
    localparam S_MOVE_DOWN        = 3'b011;
    localparam S_EMERGENCY_RESCUE = 3'b100;
    localparam S_EMERGENCY        = 3'b101;
 
    reg [2:0] state_q, state_d;
 
    reg [FLOORS-1:0] pending_q;
    reg [1:0]        move_timer;   // enough bits for MOVE_TICKS
    reg [1:0]        door_timer;   // enough bits for DOOR_TICKS
    reg              saved_dir;    // 1=was up, 0=was down
 
    reg               current_req, above_req, below_req;
    reg               move_done, door_done, nearest_floor_reached;
    reg [1:0]         next_floor_up, next_floor_dn;
    reg               next_cur_req_up, next_cur_req_dn;
    reg [FLOORS-1:0]  pending_new;
 
    integer i;
 
    always @(*) begin
        pending_new = pending_q | floor_request;
 
        current_req = pending_new[current_floor];
 
        above_req = 1'b0;
        below_req = 1'b0;
        for (i = 0; i < FLOORS; i = i + 1) begin
            if (i > current_floor) above_req = above_req | pending_new[i];
            if (i < current_floor) below_req = below_req | pending_new[i];
        end
 
        move_done             = (move_timer == MOVE_TICKS - 1);
        door_done             = (door_timer == DOOR_TICKS - 1) & ~door_obstruction;
        nearest_floor_reached = move_done;
 
        next_floor_up = current_floor + 1;
        next_floor_dn = current_floor - 1;
 
        
        next_cur_req_up = pending_new[next_floor_up];
        next_cur_req_dn = pending_new[next_floor_dn];
    end
 
    
    always @(*) begin
        state_d = state_q;
 
        case (state_q)
            S_IDLE: begin
                if      (emergency_stop) state_d = S_EMERGENCY;
                else if (current_req)    state_d = S_DOOR_OPEN;
                else if (above_req)      state_d = S_MOVE_UP;
                else if (below_req)      state_d = S_MOVE_DOWN;
            end
 
            S_MOVE_UP: begin
                if      (emergency_stop)                  state_d = S_EMERGENCY_RESCUE;
                else if (move_done & next_cur_req_up)     state_d = S_DOOR_OPEN;
            end
 
            S_MOVE_DOWN: begin
                if      (emergency_stop)                  state_d = S_EMERGENCY_RESCUE;
                else if (move_done & next_cur_req_dn)     state_d = S_DOOR_OPEN;
            end
 
            S_DOOR_OPEN: begin
                if      (emergency_stop)             state_d = S_EMERGENCY;
                else if (door_obstruction)           state_d = S_DOOR_OPEN;
                else if (door_done & above_req)      state_d = S_MOVE_UP;
                else if (door_done & below_req)      state_d = S_MOVE_DOWN;
                else if (door_done)                  state_d = S_IDLE;
            end
 
            S_EMERGENCY_RESCUE: begin
                if (nearest_floor_reached) state_d = S_EMERGENCY;
            end
 
            S_EMERGENCY: begin
                if (!emergency_stop) state_d = S_IDLE;
            end
 
            default: state_d = S_IDLE;
        endcase
    end
 
    always @(posedge clk) begin
        if (rst) begin
            state_q       <= S_IDLE;
            current_floor <= 2'b00;
            pending_q     <= {FLOORS{1'b0}};
            move_timer    <= 2'b00;
            door_timer    <= 2'b00;
            saved_dir     <= 1'b0;
        end else begin
           
            pending_q <= pending_q | floor_request;
 
            state_q <= state_d;
 
            case (state_q)
                S_MOVE_UP: begin
                    if (emergency_stop) begin
                        saved_dir  <= 1'b0;   // invert: rescue goes DOWN to lower floor
                        move_timer <= 2'b00;
                    end else if (move_done) begin
                        current_floor <= current_floor + 1;
                        move_timer    <= 2'b00;
                    end else begin
                        move_timer <= move_timer + 1;
                    end
                end
 
                S_MOVE_DOWN: begin
                    if (emergency_stop) begin
                        saved_dir  <= 1'b0;
                        move_timer <= 2'b00;
                    end else if (move_done) begin
                        current_floor <= current_floor - 1;
                        move_timer    <= 2'b00;
                    end else begin
                        move_timer <= move_timer + 1;
                    end
                end
 
                S_DOOR_OPEN: begin
                    if (!emergency_stop) begin
                        // Clear the serviced floor's request
                        pending_q[current_floor] <= 1'b0;
                        if (!door_obstruction)
                            door_timer <= door_timer + 1;
                    end
                    if (door_done) door_timer <= 2'b00;
                end
 
                S_EMERGENCY_RESCUE: begin
                    if (nearest_floor_reached) begin
                        current_floor <= saved_dir ?
                                         current_floor + 1 :
                                         current_floor - 1;
                        move_timer <= 2'b00;
                    end else begin
                        move_timer <= move_timer + 1;
                    end
                end
 
                default: begin
                    move_timer <= 2'b00;
                    door_timer <= 2'b00;
                end
            endcase
        end
    end
 
    
    always @(*) begin
        door_open  = 1'b0;
        motor_up   = 1'b0;
        motor_down = 1'b0;
 
        case (state_q)
            S_IDLE:             ; // all zero
            S_MOVE_UP:          motor_up   = 1'b1;
            S_MOVE_DOWN:        motor_down = 1'b1;
            S_DOOR_OPEN:        door_open  = 1'b1;
            S_EMERGENCY_RESCUE: begin
                motor_up   =  saved_dir;
                motor_down = ~saved_dir;
            end
            S_EMERGENCY:        door_open  = 1'b1;
            default:            ;
        endcase
    end
 
    assign state_dbg = state_q;
 
endmodule