/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg red,
    output reg green,
    output reg blue,
    output reg hsync,
    output reg vsync,
    input a_button,
    input u_button,
    input d_button,
    input r_button,
    input l_button
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  reg [10:0] M_pixel_d, M_pixel_q = 1'h0;
  reg [10:0] M_line_d, M_line_q = 1'h0;
  reg [10:0] M_userX_d, M_userX_q = 1'h0;
  reg [10:0] M_userY_d, M_userY_q = 1'h0;
  
  wire [11-1:0] M_userChar_charXOut;
  wire [11-1:0] M_userChar_charYOut;
  wire [1-1:0] M_userChar_r;
  wire [1-1:0] M_userChar_g;
  wire [1-1:0] M_userChar_b;
  reg [11-1:0] M_userChar_charX;
  reg [11-1:0] M_userChar_charY;
  reg [11-1:0] M_userChar_cursorX;
  reg [11-1:0] M_userChar_cursorY;
  user_2 userChar (
    .charX(M_userChar_charX),
    .charY(M_userChar_charY),
    .cursorX(M_userChar_cursorX),
    .cursorY(M_userChar_cursorY),
    .charXOut(M_userChar_charXOut),
    .charYOut(M_userChar_charYOut),
    .r(M_userChar_r),
    .g(M_userChar_g),
    .b(M_userChar_b)
  );
  
  always @* begin
    M_line_d = M_line_q;
    M_userY_d = M_userY_q;
    M_userX_d = M_userX_q;
    M_pixel_d = M_pixel_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_userChar_cursorX = M_pixel_q;
    M_userChar_cursorY = M_line_q;
    if (u_button == 1'h1) begin
      M_userY_d = M_userY_q - 1'h1;
      M_userChar_charY = M_userY_q;
    end
    if (d_button == 1'h1) begin
      M_userY_d = M_userY_q + 1'h1;
    end
    if (l_button == 1'h1) begin
      M_userX_d = M_userX_q - 1'h1;
    end
    if (r_button == 1'h1) begin
      M_userX_d = M_userX_q + 1'h1;
    end
    M_userChar_charX = M_userX_q;
    M_userChar_charY = M_userY_q;
    if (M_pixel_q < 10'h320 && M_line_q < 10'h258) begin
      red = M_userChar_r;
      green = M_userChar_g;
      blue = M_userChar_b;
    end else begin
      red = 1'h0;
      blue = 1'h0;
      green = 1'h0;
    end
    if (M_pixel_q >= 12'h357 && M_pixel_q <= 13'h03ce) begin
      hsync = 1'h1;
    end else begin
      hsync = 1'h0;
    end
    if (M_line_q >= 12'h27c && M_line_q <= 13'h0281) begin
      vsync = 1'h1;
    end else begin
      vsync = 1'h0;
    end
    if (M_pixel_q == 14'h040f) begin
      if (M_line_q == 14'h0299) begin
        M_line_d = 1'h0;
      end else begin
        M_line_d = M_line_q + 1'h1;
      end
      M_pixel_d = 1'h0;
    end else begin
      M_pixel_d = M_pixel_q + 1'h1;
    end
    led[0+4-:5] = {u_button, d_button, l_button, r_button, a_button};
  end
  
  always @(posedge clk) begin
    M_pixel_q <= M_pixel_d;
    M_line_q <= M_line_d;
    M_userX_q <= M_userX_d;
    M_userY_q <= M_userY_d;
  end
  
endmodule