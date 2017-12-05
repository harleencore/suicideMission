/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module enemy_4 (
    input clk,
    input rst,
    input [10:0] cursorX,
    input [10:0] cursorY,
    output reg [10:0] enemyPosX,
    output reg [10:0] enemyPosY,
    output reg r,
    output reg g,
    output reg b
  );
  
  
  
  reg [10:0] M_charX_d, M_charX_q = 9'h190;
  reg [10:0] M_charY_d, M_charY_q = 7'h6e;
  localparam RANDOM_R_state = 2'd0;
  localparam RANDOM_L_state = 2'd1;
  localparam RANDOM_U_state = 2'd2;
  localparam RANDOM_D_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = RANDOM_R_state;
  reg [17:0] M_timer_d, M_timer_q = 1'h0;
  reg [19:0] M_statecounter_d, M_statecounter_q = 1'h0;
  reg [31:0] M_difficultyTimer_d, M_difficultyTimer_q = 1'h0;
  reg [19:0] M_difficultyLevel_d, M_difficultyLevel_q = 1'h0;
  
  wire [32-1:0] M_rand_num;
  reg [1-1:0] M_rand_clk;
  reg [1-1:0] M_rand_rst;
  reg [1-1:0] M_rand_next;
  reg [32-1:0] M_rand_seed;
  pn_gen_10 rand (
    .clk(M_rand_clk),
    .rst(M_rand_rst),
    .next(M_rand_next),
    .seed(M_rand_seed),
    .num(M_rand_num)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_charY_d = M_charY_q;
    M_timer_d = M_timer_q;
    M_charX_d = M_charX_q;
    M_difficultyLevel_d = M_difficultyLevel_q;
    M_statecounter_d = M_statecounter_q;
    M_difficultyTimer_d = M_difficultyTimer_q;
    
    M_rand_seed = 11'h539;
    M_rand_next = M_timer_q[0+0-:1];
    M_rand_clk = clk;
    M_rand_rst = rst;
    M_difficultyTimer_d = M_difficultyTimer_q + 1'h1;
    if (M_difficultyTimer_q[31+0-:1] == 1'h1) begin
      M_difficultyLevel_d = M_difficultyLevel_q + 1'h1;
      M_difficultyTimer_d = 1'h0;
    end
    r = 1'h0;
    g = 1'h0;
    b = 1'h0;
    if ((cursorX - M_charX_q + 5'h1a) > 1'h0 && (cursorX - M_charX_q + 5'h1a) < 7'h50) begin
      if ((cursorY - M_charY_q + 5'h1a) > 1'h0 && (cursorY - M_charY_q + 5'h1a) < 7'h64) begin
        if (M_difficultyLevel_q >= 1'h0 && M_difficultyLevel_q < 2'h2) begin
          r = 1'h0;
          g = 1'h1;
          b = 1'h1;
        end else begin
          if (M_difficultyLevel_q >= 2'h2 && M_difficultyLevel_q < 3'h4) begin
            r = 1'h0;
            g = 1'h0;
            b = 1'h1;
          end else begin
            if (M_difficultyLevel_q >= 3'h4 && M_difficultyLevel_q < 3'h5) begin
              r = 1'h1;
              g = 1'h1;
              b = 1'h0;
            end else begin
              if (M_difficultyLevel_q >= 3'h5 && M_difficultyLevel_q < 3'h6) begin
                r = 1'h1;
                g = 1'h0;
                b = 1'h0;
              end else begin
                r = M_rand_num[0+0-:1];
                g = M_rand_num[1+0-:1];
                b = M_rand_num[2+0-:1];
              end
            end
          end
        end
      end
    end else begin
      r = 1'h0;
      g = 1'h0;
      b = 1'h0;
    end
    M_timer_d = M_timer_q + 1'h1;
    if (M_timer_q == 1'h1) begin
      M_statecounter_d = M_statecounter_q + 1'h1;
      if (M_statecounter_q >= 1'h0 && M_statecounter_q < 4'ha) begin
        M_state_d = RANDOM_U_state;
      end else begin
        if (M_statecounter_q >= 4'ha && M_statecounter_q < 5'h14) begin
          M_state_d = RANDOM_D_state;
        end else begin
          if (M_statecounter_q >= 5'h14 && M_statecounter_q < 5'h1e) begin
            M_state_d = RANDOM_L_state;
          end else begin
            if (M_statecounter_q >= 5'h1e && M_statecounter_q < 6'h28) begin
              M_state_d = RANDOM_R_state;
            end else begin
              M_statecounter_d = 1'h0;
            end
          end
        end
      end
      
      case (M_state_q)
        RANDOM_U_state: begin
          if (M_charY_q >= 6'h28) begin
            M_charY_d = M_charY_q - M_rand_num[0+0-:1] - M_difficultyLevel_q;
          end
        end
        RANDOM_D_state: begin
          if (M_charY_q <= 10'h212) begin
            M_charY_d = M_charY_q + M_rand_num[0+0-:1] + M_difficultyLevel_q;
          end
        end
        RANDOM_L_state: begin
          if (M_charX_q >= 6'h2d) begin
            M_charX_d = M_charX_q + M_rand_num[0+0-:1] + M_difficultyLevel_q;
          end
        end
        RANDOM_R_state: begin
          if (M_charX_q <= 10'h30c) begin
            M_charX_d = M_charX_q - M_rand_num[0+0-:1] - M_difficultyLevel_q;
          end
        end
      endcase
    end
    enemyPosX = M_charX_q;
    enemyPosY = M_charY_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    M_difficultyLevel_q <= M_difficultyLevel_d;
    
    if (rst == 1'b1) begin
      M_charX_q <= 9'h190;
      M_charY_q <= 7'h6e;
      M_timer_q <= 1'h0;
      M_statecounter_q <= 1'h0;
      M_difficultyTimer_q <= 1'h0;
    end else begin
      M_charX_q <= M_charX_d;
      M_charY_q <= M_charY_d;
      M_timer_q <= M_timer_d;
      M_statecounter_q <= M_statecounter_d;
      M_difficultyTimer_q <= M_difficultyTimer_d;
    end
  end
  
endmodule
