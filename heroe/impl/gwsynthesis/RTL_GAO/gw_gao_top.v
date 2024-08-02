module gw_gao(
    \presente[2] ,
    \presente[1] ,
    \presente[0] ,
    \display/displayout[6] ,
    \display/displayout[5] ,
    \display/displayout[4] ,
    \display/displayout[3] ,
    \display/displayout[2] ,
    \display/displayout[1] ,
    \display/displayout[0] ,
    \display/selector[7] ,
    \display/selector[6] ,
    \display/selector[5] ,
    \display/selector[4] ,
    \display/selector[3] ,
    \display/selector[2] ,
    \display/selector[1] ,
    \display/selector[0] ,
    keypad_pressed,
    \display/clk_barrido ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \presente[2] ;
input \presente[1] ;
input \presente[0] ;
input \display/displayout[6] ;
input \display/displayout[5] ;
input \display/displayout[4] ;
input \display/displayout[3] ;
input \display/displayout[2] ;
input \display/displayout[1] ;
input \display/displayout[0] ;
input \display/selector[7] ;
input \display/selector[6] ;
input \display/selector[5] ;
input \display/selector[4] ;
input \display/selector[3] ;
input \display/selector[2] ;
input \display/selector[1] ;
input \display/selector[0] ;
input keypad_pressed;
input \display/clk_barrido ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \presente[2] ;
wire \presente[1] ;
wire \presente[0] ;
wire \display/displayout[6] ;
wire \display/displayout[5] ;
wire \display/displayout[4] ;
wire \display/displayout[3] ;
wire \display/displayout[2] ;
wire \display/displayout[1] ;
wire \display/displayout[0] ;
wire \display/selector[7] ;
wire \display/selector[6] ;
wire \display/selector[5] ;
wire \display/selector[4] ;
wire \display/selector[3] ;
wire \display/selector[2] ;
wire \display/selector[1] ;
wire \display/selector[0] ;
wire keypad_pressed;
wire \display/clk_barrido ;
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
    .trig0_i(keypad_pressed),
    .data_i({\presente[2] ,\presente[1] ,\presente[0] ,\display/displayout[6] ,\display/displayout[5] ,\display/displayout[4] ,\display/displayout[3] ,\display/displayout[2] ,\display/displayout[1] ,\display/displayout[0] ,\display/selector[7] ,\display/selector[6] ,\display/selector[5] ,\display/selector[4] ,\display/selector[3] ,\display/selector[2] ,\display/selector[1] ,\display/selector[0] }),
    .clk_i(\display/clk_barrido )
);

endmodule
