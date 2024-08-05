module gw_gao(
    clk_obstaculos,
    \display_obs[6] ,
    \display_obs[5] ,
    \display_obs[4] ,
    \display_obs[3] ,
    \display_obs[2] ,
    \display_obs[1] ,
    \display_obs[0] ,
    \display_obs[13] ,
    \display_obs[12] ,
    \display_obs[11] ,
    \display_obs[10] ,
    \display_obs[9] ,
    \display_obs[8] ,
    \display_obs[7] ,
    \display_obs[20] ,
    \display_obs[19] ,
    \display_obs[18] ,
    \display_obs[17] ,
    \display_obs[16] ,
    \display_obs[15] ,
    \display_obs[14] ,
    \generador_obstaculos/mundo[1] ,
    \generador_obstaculos/mundo[0] ,
    \generador_obstaculos/obs_counter[1] ,
    \generador_obstaculos/obs_counter[0] ,
    \generador_obstaculos/bono_tomado ,
    \generador_obstaculos/DIVISOR[29] ,
    \generador_obstaculos/DIVISOR[28] ,
    \generador_obstaculos/DIVISOR[27] ,
    \generador_obstaculos/DIVISOR[26] ,
    \generador_obstaculos/DIVISOR[25] ,
    \generador_obstaculos/DIVISOR[24] ,
    \generador_obstaculos/DIVISOR[23] ,
    \generador_obstaculos/DIVISOR[22] ,
    \generador_obstaculos/DIVISOR[21] ,
    \generador_obstaculos/DIVISOR[20] ,
    \generador_obstaculos/DIVISOR[19] ,
    \generador_obstaculos/DIVISOR[18] ,
    \generador_obstaculos/DIVISOR[17] ,
    \generador_obstaculos/DIVISOR[16] ,
    \generador_obstaculos/DIVISOR[15] ,
    \generador_obstaculos/DIVISOR[14] ,
    \generador_obstaculos/DIVISOR[13] ,
    \generador_obstaculos/DIVISOR[12] ,
    \generador_obstaculos/DIVISOR[11] ,
    \generador_obstaculos/DIVISOR[10] ,
    \generador_obstaculos/DIVISOR[9] ,
    \generador_obstaculos/DIVISOR[8] ,
    \generador_obstaculos/DIVISOR[7] ,
    \generador_obstaculos/DIVISOR[6] ,
    \generador_obstaculos/DIVISOR[5] ,
    \generador_obstaculos/DIVISOR[4] ,
    \generador_obstaculos/DIVISOR[3] ,
    \generador_obstaculos/DIVISOR[2] ,
    \generador_obstaculos/DIVISOR[1] ,
    \generador_obstaculos/DIVISOR[0] ,
    \display/display_obs[6] ,
    \display/display_obs[5] ,
    \display/display_obs[4] ,
    \display/display_obs[3] ,
    \display/display_obs[2] ,
    \display/display_obs[1] ,
    \display/display_obs[0] ,
    \fsm/clkDBG ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input clk_obstaculos;
input \display_obs[6] ;
input \display_obs[5] ;
input \display_obs[4] ;
input \display_obs[3] ;
input \display_obs[2] ;
input \display_obs[1] ;
input \display_obs[0] ;
input \display_obs[13] ;
input \display_obs[12] ;
input \display_obs[11] ;
input \display_obs[10] ;
input \display_obs[9] ;
input \display_obs[8] ;
input \display_obs[7] ;
input \display_obs[20] ;
input \display_obs[19] ;
input \display_obs[18] ;
input \display_obs[17] ;
input \display_obs[16] ;
input \display_obs[15] ;
input \display_obs[14] ;
input \generador_obstaculos/mundo[1] ;
input \generador_obstaculos/mundo[0] ;
input \generador_obstaculos/obs_counter[1] ;
input \generador_obstaculos/obs_counter[0] ;
input \generador_obstaculos/bono_tomado ;
input \generador_obstaculos/DIVISOR[29] ;
input \generador_obstaculos/DIVISOR[28] ;
input \generador_obstaculos/DIVISOR[27] ;
input \generador_obstaculos/DIVISOR[26] ;
input \generador_obstaculos/DIVISOR[25] ;
input \generador_obstaculos/DIVISOR[24] ;
input \generador_obstaculos/DIVISOR[23] ;
input \generador_obstaculos/DIVISOR[22] ;
input \generador_obstaculos/DIVISOR[21] ;
input \generador_obstaculos/DIVISOR[20] ;
input \generador_obstaculos/DIVISOR[19] ;
input \generador_obstaculos/DIVISOR[18] ;
input \generador_obstaculos/DIVISOR[17] ;
input \generador_obstaculos/DIVISOR[16] ;
input \generador_obstaculos/DIVISOR[15] ;
input \generador_obstaculos/DIVISOR[14] ;
input \generador_obstaculos/DIVISOR[13] ;
input \generador_obstaculos/DIVISOR[12] ;
input \generador_obstaculos/DIVISOR[11] ;
input \generador_obstaculos/DIVISOR[10] ;
input \generador_obstaculos/DIVISOR[9] ;
input \generador_obstaculos/DIVISOR[8] ;
input \generador_obstaculos/DIVISOR[7] ;
input \generador_obstaculos/DIVISOR[6] ;
input \generador_obstaculos/DIVISOR[5] ;
input \generador_obstaculos/DIVISOR[4] ;
input \generador_obstaculos/DIVISOR[3] ;
input \generador_obstaculos/DIVISOR[2] ;
input \generador_obstaculos/DIVISOR[1] ;
input \generador_obstaculos/DIVISOR[0] ;
input \display/display_obs[6] ;
input \display/display_obs[5] ;
input \display/display_obs[4] ;
input \display/display_obs[3] ;
input \display/display_obs[2] ;
input \display/display_obs[1] ;
input \display/display_obs[0] ;
input \fsm/clkDBG ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire clk_obstaculos;
wire \display_obs[6] ;
wire \display_obs[5] ;
wire \display_obs[4] ;
wire \display_obs[3] ;
wire \display_obs[2] ;
wire \display_obs[1] ;
wire \display_obs[0] ;
wire \display_obs[13] ;
wire \display_obs[12] ;
wire \display_obs[11] ;
wire \display_obs[10] ;
wire \display_obs[9] ;
wire \display_obs[8] ;
wire \display_obs[7] ;
wire \display_obs[20] ;
wire \display_obs[19] ;
wire \display_obs[18] ;
wire \display_obs[17] ;
wire \display_obs[16] ;
wire \display_obs[15] ;
wire \display_obs[14] ;
wire \generador_obstaculos/mundo[1] ;
wire \generador_obstaculos/mundo[0] ;
wire \generador_obstaculos/obs_counter[1] ;
wire \generador_obstaculos/obs_counter[0] ;
wire \generador_obstaculos/bono_tomado ;
wire \generador_obstaculos/DIVISOR[29] ;
wire \generador_obstaculos/DIVISOR[28] ;
wire \generador_obstaculos/DIVISOR[27] ;
wire \generador_obstaculos/DIVISOR[26] ;
wire \generador_obstaculos/DIVISOR[25] ;
wire \generador_obstaculos/DIVISOR[24] ;
wire \generador_obstaculos/DIVISOR[23] ;
wire \generador_obstaculos/DIVISOR[22] ;
wire \generador_obstaculos/DIVISOR[21] ;
wire \generador_obstaculos/DIVISOR[20] ;
wire \generador_obstaculos/DIVISOR[19] ;
wire \generador_obstaculos/DIVISOR[18] ;
wire \generador_obstaculos/DIVISOR[17] ;
wire \generador_obstaculos/DIVISOR[16] ;
wire \generador_obstaculos/DIVISOR[15] ;
wire \generador_obstaculos/DIVISOR[14] ;
wire \generador_obstaculos/DIVISOR[13] ;
wire \generador_obstaculos/DIVISOR[12] ;
wire \generador_obstaculos/DIVISOR[11] ;
wire \generador_obstaculos/DIVISOR[10] ;
wire \generador_obstaculos/DIVISOR[9] ;
wire \generador_obstaculos/DIVISOR[8] ;
wire \generador_obstaculos/DIVISOR[7] ;
wire \generador_obstaculos/DIVISOR[6] ;
wire \generador_obstaculos/DIVISOR[5] ;
wire \generador_obstaculos/DIVISOR[4] ;
wire \generador_obstaculos/DIVISOR[3] ;
wire \generador_obstaculos/DIVISOR[2] ;
wire \generador_obstaculos/DIVISOR[1] ;
wire \generador_obstaculos/DIVISOR[0] ;
wire \display/display_obs[6] ;
wire \display/display_obs[5] ;
wire \display/display_obs[4] ;
wire \display/display_obs[3] ;
wire \display/display_obs[2] ;
wire \display/display_obs[1] ;
wire \display/display_obs[0] ;
wire \fsm/clkDBG ;
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
    .trig0_i({\display/display_obs[6] ,\display/display_obs[5] ,\display/display_obs[4] ,\display/display_obs[3] ,\display/display_obs[2] ,\display/display_obs[1] ,\display/display_obs[0] }),
    .data_i({clk_obstaculos,\display_obs[6] ,\display_obs[5] ,\display_obs[4] ,\display_obs[3] ,\display_obs[2] ,\display_obs[1] ,\display_obs[0] ,\display_obs[13] ,\display_obs[12] ,\display_obs[11] ,\display_obs[10] ,\display_obs[9] ,\display_obs[8] ,\display_obs[7] ,\display_obs[20] ,\display_obs[19] ,\display_obs[18] ,\display_obs[17] ,\display_obs[16] ,\display_obs[15] ,\display_obs[14] ,\generador_obstaculos/mundo[1] ,\generador_obstaculos/mundo[0] ,\generador_obstaculos/obs_counter[1] ,\generador_obstaculos/obs_counter[0] ,\generador_obstaculos/bono_tomado ,\generador_obstaculos/DIVISOR[29] ,\generador_obstaculos/DIVISOR[28] ,\generador_obstaculos/DIVISOR[27] ,\generador_obstaculos/DIVISOR[26] ,\generador_obstaculos/DIVISOR[25] ,\generador_obstaculos/DIVISOR[24] ,\generador_obstaculos/DIVISOR[23] ,\generador_obstaculos/DIVISOR[22] ,\generador_obstaculos/DIVISOR[21] ,\generador_obstaculos/DIVISOR[20] ,\generador_obstaculos/DIVISOR[19] ,\generador_obstaculos/DIVISOR[18] ,\generador_obstaculos/DIVISOR[17] ,\generador_obstaculos/DIVISOR[16] ,\generador_obstaculos/DIVISOR[15] ,\generador_obstaculos/DIVISOR[14] ,\generador_obstaculos/DIVISOR[13] ,\generador_obstaculos/DIVISOR[12] ,\generador_obstaculos/DIVISOR[11] ,\generador_obstaculos/DIVISOR[10] ,\generador_obstaculos/DIVISOR[9] ,\generador_obstaculos/DIVISOR[8] ,\generador_obstaculos/DIVISOR[7] ,\generador_obstaculos/DIVISOR[6] ,\generador_obstaculos/DIVISOR[5] ,\generador_obstaculos/DIVISOR[4] ,\generador_obstaculos/DIVISOR[3] ,\generador_obstaculos/DIVISOR[2] ,\generador_obstaculos/DIVISOR[1] ,\generador_obstaculos/DIVISOR[0] }),
    .clk_i(\fsm/clkDBG )
);

endmodule
