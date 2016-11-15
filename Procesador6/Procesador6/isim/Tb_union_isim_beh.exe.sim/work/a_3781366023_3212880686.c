/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/karenTatiana/Desktop/Arquetectura-de-Computadores/Procesador6/SEU2.vhd";
extern char *IEEE_P_2592010699;



static void work_a_3781366023_3212880686_p_0(char *t0)
{
    char t12[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (21 - 21);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)2);
    if (t8 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 1032U);
    t9 = *((char **)t1);
    t10 = ((IEEE_P_2592010699) + 4024);
    t11 = (t0 + 4964U);
    t13 = (t0 + 4916U);
    t1 = xsi_base_array_concat(t1, t12, t10, (char)97, t2, t11, (char)97, t9, t13, (char)101);
    t4 = (10U + 22U);
    t7 = (32U != t4);
    if (t7 == 1)
        goto LAB7;

LAB8:    t14 = (t0 + 3072);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t1, 32U);
    xsi_driver_first_trans_fast_port(t14);

LAB3:    t1 = (t0 + 2992);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(30, ng0);
    t9 = (t0 + 1352U);
    t10 = *((char **)t9);
    t9 = (t0 + 1032U);
    t11 = *((char **)t9);
    t13 = ((IEEE_P_2592010699) + 4024);
    t14 = (t0 + 4948U);
    t15 = (t0 + 4916U);
    t9 = xsi_base_array_concat(t9, t12, t13, (char)97, t10, t14, (char)97, t11, t15, (char)101);
    t16 = (10U + 22U);
    t17 = (32U != t16);
    if (t17 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 3072);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t9, 32U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB3;

LAB5:    xsi_size_not_matching(32U, t16, 0);
    goto LAB6;

LAB7:    xsi_size_not_matching(32U, t4, 0);
    goto LAB8;

}


extern void work_a_3781366023_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3781366023_3212880686_p_0};
	xsi_register_didat("work_a_3781366023_3212880686", "isim/Tb_union_isim_beh.exe.sim/work/a_3781366023_3212880686.didat");
	xsi_register_executes(pe);
}
