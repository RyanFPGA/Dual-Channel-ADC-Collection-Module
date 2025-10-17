module gw_gao(
    \ad_data1[9] ,
    \ad_data1[8] ,
    \ad_data1[7] ,
    \ad_data1[6] ,
    \ad_data1[5] ,
    \ad_data1[4] ,
    \ad_data1[3] ,
    \ad_data1[2] ,
    \ad_data1[1] ,
    \ad_data1[0] ,
    \ad_data2[9] ,
    \ad_data2[8] ,
    \ad_data2[7] ,
    \ad_data2[6] ,
    \ad_data2[5] ,
    \ad_data2[4] ,
    \ad_data2[3] ,
    \ad_data2[2] ,
    \ad_data2[1] ,
    \ad_data2[0] ,
    ad1oe,
    ad2oe,
    OTR1,
    OTR2,
    clk_20M,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \ad_data1[9] ;
input \ad_data1[8] ;
input \ad_data1[7] ;
input \ad_data1[6] ;
input \ad_data1[5] ;
input \ad_data1[4] ;
input \ad_data1[3] ;
input \ad_data1[2] ;
input \ad_data1[1] ;
input \ad_data1[0] ;
input \ad_data2[9] ;
input \ad_data2[8] ;
input \ad_data2[7] ;
input \ad_data2[6] ;
input \ad_data2[5] ;
input \ad_data2[4] ;
input \ad_data2[3] ;
input \ad_data2[2] ;
input \ad_data2[1] ;
input \ad_data2[0] ;
input ad1oe;
input ad2oe;
input OTR1;
input OTR2;
input clk_20M;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \ad_data1[9] ;
wire \ad_data1[8] ;
wire \ad_data1[7] ;
wire \ad_data1[6] ;
wire \ad_data1[5] ;
wire \ad_data1[4] ;
wire \ad_data1[3] ;
wire \ad_data1[2] ;
wire \ad_data1[1] ;
wire \ad_data1[0] ;
wire \ad_data2[9] ;
wire \ad_data2[8] ;
wire \ad_data2[7] ;
wire \ad_data2[6] ;
wire \ad_data2[5] ;
wire \ad_data2[4] ;
wire \ad_data2[3] ;
wire \ad_data2[2] ;
wire \ad_data2[1] ;
wire \ad_data2[0] ;
wire ad1oe;
wire ad2oe;
wire OTR1;
wire OTR2;
wire clk_20M;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i(OTR1),
    .data_i({\ad_data1[9] ,\ad_data1[8] ,\ad_data1[7] ,\ad_data1[6] ,\ad_data1[5] ,\ad_data1[4] ,\ad_data1[3] ,\ad_data1[2] ,\ad_data1[1] ,\ad_data1[0] ,\ad_data2[9] ,\ad_data2[8] ,\ad_data2[7] ,\ad_data2[6] ,\ad_data2[5] ,\ad_data2[4] ,\ad_data2[3] ,\ad_data2[2] ,\ad_data2[1] ,\ad_data2[0] ,ad1oe,ad2oe,OTR1,OTR2}),
    .clk_i(clk_20M)
);

endmodule
