module gw_gao(
    clk_obstaculos,
    \W_or_L[1] ,
    \W_or_L[0] ,
    \presente[2] ,
    \presente[1] ,
    \presente[0] ,
    \heroe[6] ,
    \heroe[5] ,
    \heroe[4] ,
    \heroe[3] ,
    \heroe[2] ,
    \heroe[1] ,
    \heroe[0] ,
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
    \key[4] ,
    \key[3] ,
    \key[2] ,
    \key[1] ,
    \key[0] ,
    \generador_obstaculos/mundo[1] ,
    \generador_obstaculos/mundo[0] ,
    keypad_pressed,
    \fsm/clkDBG ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input clk_obstaculos;
input \W_or_L[1] ;
input \W_or_L[0] ;
input \presente[2] ;
input \presente[1] ;
input \presente[0] ;
input \heroe[6] ;
input \heroe[5] ;
input \heroe[4] ;
input \heroe[3] ;
input \heroe[2] ;
input \heroe[1] ;
input \heroe[0] ;
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
input \key[4] ;
input \key[3] ;
input \key[2] ;
input \key[1] ;
input \key[0] ;
input \generador_obstaculos/mundo[1] ;
input \generador_obstaculos/mundo[0] ;
input keypad_pressed;
input \fsm/clkDBG ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire clk_obstaculos;
wire \W_or_L[1] ;
wire \W_or_L[0] ;
wire \presente[2] ;
wire \presente[1] ;
wire \presente[0] ;
wire \heroe[6] ;
wire \heroe[5] ;
wire \heroe[4] ;
wire \heroe[3] ;
wire \heroe[2] ;
wire \heroe[1] ;
wire \heroe[0] ;
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
wire \key[4] ;
wire \key[3] ;
wire \key[2] ;
wire \key[1] ;
wire \key[0] ;
wire \generador_obstaculos/mundo[1] ;
wire \generador_obstaculos/mundo[0] ;
wire keypad_pressed;
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
    .trig0_i(keypad_pressed),
    .data_i({clk_obstaculos,\W_or_L[1] ,\W_or_L[0] ,\presente[2] ,\presente[1] ,\presente[0] ,\heroe[6] ,\heroe[5] ,\heroe[4] ,\heroe[3] ,\heroe[2] ,\heroe[1] ,\heroe[0] ,\display_obs[6] ,\display_obs[5] ,\display_obs[4] ,\display_obs[3] ,\display_obs[2] ,\display_obs[1] ,\display_obs[0] ,\display_obs[13] ,\display_obs[12] ,\display_obs[11] ,\display_obs[10] ,\display_obs[9] ,\display_obs[8] ,\display_obs[7] ,\display_obs[20] ,\display_obs[19] ,\display_obs[18] ,\display_obs[17] ,\display_obs[16] ,\display_obs[15] ,\display_obs[14] ,\key[4] ,\key[3] ,\key[2] ,\key[1] ,\key[0] ,\generador_obstaculos/mundo[1] ,\generador_obstaculos/mundo[0] }),
    .clk_i(\fsm/clkDBG )
);

endmodule
