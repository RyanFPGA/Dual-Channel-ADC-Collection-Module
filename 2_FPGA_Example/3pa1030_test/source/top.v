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
wire clk_125M ;
wire clk_35M ;
reg  [7:0]cnt ;
wire clk_10M ;
wire clk_20M;

assign ad_clk1 = clk_20M ;
assign ad_clk2 = clk_20M ;

assign ad1oe = 0;
assign ad2oe = 0;

ad_clock u_pll (
//   .clkin1(clk_50M),          // input
//   .pll_lock(lock),          // output
//   .clkout0(clk_125M) ,        // output
//   .clkout1(clk_35M),      // output
//   .clkout2(clk_10M)       // output       // output
  .clkin1(clk_50M),        // input
  .pll_lock(lock),    // output
  .clkout0(clk_20M)       // output
);

// always @(negedge clk_10M or negedge rst_n) begin
//    if (~rst_n)
//       cnt <= 8'd0 ;
// //   else if (cnt == 8'd127)
// //      cnt <= 8'd0 ;
//    else 
//       cnt <= cnt - 1'b1 ; 
// end


endmodule