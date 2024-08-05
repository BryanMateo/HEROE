module gw_gao(
    \progreso[4] ,
    \progreso[3] ,
    \progreso[2] ,
    \progreso[1] ,
    \progreso[0] ,
    \generador_obstaculos/conteo_obs[6] ,
    \generador_obstaculos/conteo_obs[5] ,
    \generador_obstaculos/conteo_obs[4] ,
    \generador_obstaculos/conteo_obs[3] ,
    \generador_obstaculos/conteo_obs[2] ,
    \generador_obstaculos/conteo_obs[1] ,
    \generador_obstaculos/conteo_obs[0] ,
    \generador_obstaculos/condicion ,
    \mundo[1] ,
    \mundo[0] ,
    \key[4] ,
    \key[3] ,
    \key[2] ,
    \key[1] ,
    \key[0] ,
    \fsm/clkDBG ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \progreso[4] ;
input \progreso[3] ;
input \progreso[2] ;
input \progreso[1] ;
input \progreso[0] ;
input \generador_obstaculos/conteo_obs[6] ;
input \generador_obstaculos/conteo_obs[5] ;
input \generador_obstaculos/conteo_obs[4] ;
input \generador_obstaculos/conteo_obs[3] ;
input \generador_obstaculos/conteo_obs[2] ;
input \generador_obstaculos/conteo_obs[1] ;
input \generador_obstaculos/conteo_obs[0] ;
input \generador_obstaculos/condicion ;
input \mundo[1] ;
input \mundo[0] ;
input \key[4] ;
input \key[3] ;
input \key[2] ;
input \key[1] ;
input \key[0] ;
input \fsm/clkDBG ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \progreso[4] ;
wire \progreso[3] ;
wire \progreso[2] ;
wire \progreso[1] ;
wire \progreso[0] ;
wire \generador_obstaculos/conteo_obs[6] ;
wire \generador_obstaculos/conteo_obs[5] ;
wire \generador_obstaculos/conteo_obs[4] ;
wire \generador_obstaculos/conteo_obs[3] ;
wire \generador_obstaculos/conteo_obs[2] ;
wire \generador_obstaculos/conteo_obs[1] ;
wire \generador_obstaculos/conteo_obs[0] ;
wire \generador_obstaculos/condicion ;
wire \mundo[1] ;
wire \mundo[0] ;
wire \key[4] ;
wire \key[3] ;
wire \key[2] ;
wire \key[1] ;
wire \key[0] ;
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
    .trig0_i({\key[4] ,\key[3] ,\key[2] ,\key[1] ,\key[0] }),
    .data_i({\progreso[4] ,\progreso[3] ,\progreso[2] ,\progreso[1] ,\progreso[0] ,\generador_obstaculos/conteo_obs[6] ,\generador_obstaculos/conteo_obs[5] ,\generador_obstaculos/conteo_obs[4] ,\generador_obstaculos/conteo_obs[3] ,\generador_obstaculos/conteo_obs[2] ,\generador_obstaculos/conteo_obs[1] ,\generador_obstaculos/conteo_obs[0] ,\generador_obstaculos/condicion ,\mundo[1] ,\mundo[0] }),
    .clk_i(\fsm/clkDBG )
);

endmodule
