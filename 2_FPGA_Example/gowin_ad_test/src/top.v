module top(
   input  wire clk_50M ,
   input  wire rst_n ,
   output wire ad_clk1 /* synthesis PAP_MARK_DEBUG="true" */,
   output wire ad_clk2 /* synthesis PAP_MARK_DEBUG="true" */,
   input  wire [9:0]ad_data1 /* synthesis PAP_MARK_DEBUG="true" */,
   input  wire [9:0]ad_data2 /* synthesis PAP_MARK_DEBUG="true" */,
   output wire ad1oe /* synthesis PAP_MARK_DEBUG="true" */,
   output wire ad2oe /* synthesis PAP_MARK_DEBUG="true" */,
   input wire OTR1   /* synthesis PAP_MARK_DEBUG="true" */,
   input wire OTR2   /* synthesis PAP_MARK_DEBUG="true" */

   );

wire lock ;
reg  [7:0]cnt ;
wire clk_20M;

assign ad_clk1 = clk_20M ;
assign ad_clk2 = clk_20M ;

assign ad1oe = 0;
assign ad2oe = 0;

// ad_clock u_pll (
//   .clkin1(clk_50M),        // input
//   .pll_lock(lock),    // output
//   .clkout0(clk_20M)       // output
// );

Gowin_PLL u_pll(
        .lock(lock), //output lock
        .clkout0(clk_20M), //output clkout0
        .clkin(clk_50M) //input clkin
    );
endmodule