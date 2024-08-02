module gw_gao(
    \presente[2] ,
    \presente[1] ,
    \presente[0] ,
    \tipo_obs[3] ,
    \tipo_obs[2] ,
    \tipo_obs[1] ,
    \tipo_obs[0] ,
    \tipo_obs1[3] ,
    \tipo_obs1[2] ,
    \tipo_obs1[1] ,
    \tipo_obs1[0] ,
    \generador_obstaculos/display_obs[20] ,
    \generador_obstaculos/display_obs[19] ,
    \generador_obstaculos/display_obs[18] ,
    \generador_obstaculos/display_obs[17] ,
    \generador_obstaculos/display_obs[16] ,
    \generador_obstaculos/display_obs[15] ,
    \generador_obstaculos/display_obs[14] ,
    \generador_obstaculos/display_obs[13] ,
    \generador_obstaculos/display_obs[12] ,
    \generador_obstaculos/display_obs[11] ,
    \generador_obstaculos/display_obs[10] ,
    \generador_obstaculos/display_obs[9] ,
    \generador_obstaculos/display_obs[8] ,
    \generador_obstaculos/display_obs[7] ,
    \generador_obstaculos/display_obs[6] ,
    \generador_obstaculos/display_obs[5] ,
    \generador_obstaculos/display_obs[4] ,
    \generador_obstaculos/display_obs[3] ,
    \generador_obstaculos/display_obs[2] ,
    \generador_obstaculos/display_obs[1] ,
    \generador_obstaculos/display_obs[0] ,
    \generador_obstaculos/r_reg[3] ,
    \generador_obstaculos/r_reg[2] ,
    \generador_obstaculos/r_reg[1] ,
    \generador_obstaculos/r_reg[0] ,
    keypad_pressed,
    \generador_obstaculos/clk_obstaculos ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \presente[2] ;
input \presente[1] ;
input \presente[0] ;
input \tipo_obs[3] ;
input \tipo_obs[2] ;
input \tipo_obs[1] ;
input \tipo_obs[0] ;
input \tipo_obs1[3] ;
input \tipo_obs1[2] ;
input \tipo_obs1[1] ;
input \tipo_obs1[0] ;
input \generador_obstaculos/display_obs[20] ;
input \generador_obstaculos/display_obs[19] ;
input \generador_obstaculos/display_obs[18] ;
input \generador_obstaculos/display_obs[17] ;
input \generador_obstaculos/display_obs[16] ;
input \generador_obstaculos/display_obs[15] ;
input \generador_obstaculos/display_obs[14] ;
input \generador_obstaculos/display_obs[13] ;
input \generador_obstaculos/display_obs[12] ;
input \generador_obstaculos/display_obs[11] ;
input \generador_obstaculos/display_obs[10] ;
input \generador_obstaculos/display_obs[9] ;
input \generador_obstaculos/display_obs[8] ;
input \generador_obstaculos/display_obs[7] ;
input \generador_obstaculos/display_obs[6] ;
input \generador_obstaculos/display_obs[5] ;
input \generador_obstaculos/display_obs[4] ;
input \generador_obstaculos/display_obs[3] ;
input \generador_obstaculos/display_obs[2] ;
input \generador_obstaculos/display_obs[1] ;
input \generador_obstaculos/display_obs[0] ;
input \generador_obstaculos/r_reg[3] ;
input \generador_obstaculos/r_reg[2] ;
input \generador_obstaculos/r_reg[1] ;
input \generador_obstaculos/r_reg[0] ;
input keypad_pressed;
input \generador_obstaculos/clk_obstaculos ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \presente[2] ;
wire \presente[1] ;
wire \presente[0] ;
wire \tipo_obs[3] ;
wire \tipo_obs[2] ;
wire \tipo_obs[1] ;
wire \tipo_obs[0] ;
wire \tipo_obs1[3] ;
wire \tipo_obs1[2] ;
wire \tipo_obs1[1] ;
wire \tipo_obs1[0] ;
wire \generador_obstaculos/display_obs[20] ;
wire \generador_obstaculos/display_obs[19] ;
wire \generador_obstaculos/display_obs[18] ;
wire \generador_obstaculos/display_obs[17] ;
wire \generador_obstaculos/display_obs[16] ;
wire \generador_obstaculos/display_obs[15] ;
wire \generador_obstaculos/display_obs[14] ;
wire \generador_obstaculos/display_obs[13] ;
wire \generador_obstaculos/display_obs[12] ;
wire \generador_obstaculos/display_obs[11] ;
wire \generador_obstaculos/display_obs[10] ;
wire \generador_obstaculos/display_obs[9] ;
wire \generador_obstaculos/display_obs[8] ;
wire \generador_obstaculos/display_obs[7] ;
wire \generador_obstaculos/display_obs[6] ;
wire \generador_obstaculos/display_obs[5] ;
wire \generador_obstaculos/display_obs[4] ;
wire \generador_obstaculos/display_obs[3] ;
wire \generador_obstaculos/display_obs[2] ;
wire \generador_obstaculos/display_obs[1] ;
wire \generador_obstaculos/display_obs[0] ;
wire \generador_obstaculos/r_reg[3] ;
wire \generador_obstaculos/r_reg[2] ;
wire \generador_obstaculos/r_reg[1] ;
wire \generador_obstaculos/r_reg[0] ;
wire keypad_pressed;
wire \generador_obstaculos/clk_obstaculos ;
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
    .data_i({\presente[2] ,\presente[1] ,\presente[0] ,\tipo_obs[3] ,\tipo_obs[2] ,\tipo_obs[1] ,\tipo_obs[0] ,\tipo_obs1[3] ,\tipo_obs1[2] ,\tipo_obs1[1] ,\tipo_obs1[0] ,\generador_obstaculos/display_obs[20] ,\generador_obstaculos/display_obs[19] ,\generador_obstaculos/display_obs[18] ,\generador_obstaculos/display_obs[17] ,\generador_obstaculos/display_obs[16] ,\generador_obstaculos/display_obs[15] ,\generador_obstaculos/display_obs[14] ,\generador_obstaculos/display_obs[13] ,\generador_obstaculos/display_obs[12] ,\generador_obstaculos/display_obs[11] ,\generador_obstaculos/display_obs[10] ,\generador_obstaculos/display_obs[9] ,\generador_obstaculos/display_obs[8] ,\generador_obstaculos/display_obs[7] ,\generador_obstaculos/display_obs[6] ,\generador_obstaculos/display_obs[5] ,\generador_obstaculos/display_obs[4] ,\generador_obstaculos/display_obs[3] ,\generador_obstaculos/display_obs[2] ,\generador_obstaculos/display_obs[1] ,\generador_obstaculos/display_obs[0] ,\generador_obstaculos/r_reg[3] ,\generador_obstaculos/r_reg[2] ,\generador_obstaculos/r_reg[1] ,\generador_obstaculos/r_reg[0] }),
    .clk_i(\generador_obstaculos/clk_obstaculos )
);

endmodule
