--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.68d
--  \   \         Application: netgen
--  /   /         Filename: TOP_timesim.vhd
-- /___/   /\     Timestamp: Thu Jan 28 11:33:19 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 4 -pcf TOP.pcf -rpw 100 -tpw 0 -ar Structure -tm TOP -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim TOP.ncd TOP_timesim.vhd 
-- Device	: 3s500efg320-4 (PRODUCTION 1.27 2013-06-08)
-- Input file	: TOP.ncd
-- Output file	: C:\Users\152\Russell_Jeffrey_Jack\lab2\netgen\par\TOP_timesim.vhd
-- # of Entities	: 1
-- Design Name	: TOP
-- Xilinx	: C:\Xilinx\14.6\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity TOP is
  port (
    S : out STD_LOGIC; 
    E : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    F : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    D : in STD_LOGIC_VECTOR ( 11 downto 0 ) 
  );
end TOP;

architecture Structure of TOP is
  signal D_0_IBUF_35 : STD_LOGIC; 
  signal D_11_INBUF : STD_LOGIC; 
  signal D_0_INBUF : STD_LOGIC; 
  signal E_0_O : STD_LOGIC; 
  signal E_1_O : STD_LOGIC; 
  signal E_2_O : STD_LOGIC; 
  signal F_0_O : STD_LOGIC; 
  signal F_1_O : STD_LOGIC; 
  signal F_2_O : STD_LOGIC; 
  signal F_3_O : STD_LOGIC; 
  signal S_O : STD_LOGIC; 
  signal F_0_OBUF_XORF_128 : STD_LOGIC; 
  signal F_0_OBUF_CYINIT_127 : STD_LOGIC; 
  signal D_0_IBUF_rt_125 : STD_LOGIC; 
  signal F_0_OBUF_BXINV_117 : STD_LOGIC; 
  signal E_0_OUTPUT_OFF_O1INV_57 : STD_LOGIC; 
  signal E_1_OUTPUT_OFF_O1INV_65 : STD_LOGIC; 
  signal E_2_OUTPUT_OFF_O1INV_73 : STD_LOGIC; 
  signal F_1_OUTPUT_OFF_O1INV_89 : STD_LOGIC; 
  signal F_2_OUTPUT_OFF_O1INV_97 : STD_LOGIC; 
  signal F_3_OUTPUT_OFF_O1INV_105 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
begin
  D_11_IBUF : X_BUF
    generic map(
      LOC => "IPAD228",
      PATHPULSE => 798 ps
    )
    port map (
      I => D(11),
      O => D_11_INBUF
    );
  D_0_IBUF : X_BUF
    generic map(
      LOC => "IPAD224",
      PATHPULSE => 798 ps
    )
    port map (
      I => D(0),
      O => D_0_INBUF
    );
  E_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD231"
    )
    port map (
      I => E_0_O,
      O => E(0)
    );
  E_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD230"
    )
    port map (
      I => E_1_O,
      O => E(1)
    );
  E_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD229"
    )
    port map (
      I => E_2_O,
      O => E(2)
    );
  F_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD227"
    )
    port map (
      I => F_0_O,
      O => F(0)
    );
  F_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD232"
    )
    port map (
      I => F_1_O,
      O => F(1)
    );
  F_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD225"
    )
    port map (
      I => F_2_O,
      O => F(2)
    );
  F_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD223"
    )
    port map (
      I => F_3_O,
      O => F(3)
    );
  S_OBUF : X_OBUF
    generic map(
      LOC => "PAD226"
    )
    port map (
      I => S_O,
      O => S
    );
  D_0_IBUF_rt : X_LUT4
    generic map(
      INIT => X"CCCC",
      LOC => "SLICE_X0Y82"
    )
    port map (
      ADR0 => VCC,
      ADR1 => D_0_IBUF_35,
      ADR2 => VCC,
      ADR3 => VCC,
      O => D_0_IBUF_rt_125
    );
  F_0_OBUF_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X0Y82"
    )
    port map (
      I0 => F_0_OBUF_CYINIT_127,
      I1 => D_0_IBUF_rt_125,
      O => F_0_OBUF_XORF_128
    );
  F_0_OBUF_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X0Y82",
      PATHPULSE => 798 ps
    )
    port map (
      I => F_0_OBUF_BXINV_117,
      O => F_0_OBUF_CYINIT_127
    );
  F_0_OBUF_BXINV : X_BUF
    generic map(
      LOC => "SLICE_X0Y82",
      PATHPULSE => 798 ps
    )
    port map (
      I => '0',
      O => F_0_OBUF_BXINV_117
    );
  D_0_IFF_IMUX : X_BUF
    generic map(
      LOC => "IPAD224",
      PATHPULSE => 798 ps
    )
    port map (
      I => D_0_INBUF,
      O => D_0_IBUF_35
    );
  E_0_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD231",
      PATHPULSE => 798 ps
    )
    port map (
      I => E_0_OUTPUT_OFF_O1INV_57,
      O => E_0_O
    );
  E_0_OUTPUT_OFF_O1INV : X_BUF
    generic map(
      LOC => "PAD231",
      PATHPULSE => 798 ps
    )
    port map (
      I => '0',
      O => E_0_OUTPUT_OFF_O1INV_57
    );
  E_1_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD230",
      PATHPULSE => 798 ps
    )
    port map (
      I => E_1_OUTPUT_OFF_O1INV_65,
      O => E_1_O
    );
  E_1_OUTPUT_OFF_O1INV : X_BUF
    generic map(
      LOC => "PAD230",
      PATHPULSE => 798 ps
    )
    port map (
      I => '0',
      O => E_1_OUTPUT_OFF_O1INV_65
    );
  E_2_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD229",
      PATHPULSE => 798 ps
    )
    port map (
      I => E_2_OUTPUT_OFF_O1INV_73,
      O => E_2_O
    );
  E_2_OUTPUT_OFF_O1INV : X_BUF
    generic map(
      LOC => "PAD229",
      PATHPULSE => 798 ps
    )
    port map (
      I => '0',
      O => E_2_OUTPUT_OFF_O1INV_73
    );
  F_0_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD227",
      PATHPULSE => 798 ps
    )
    port map (
      I => F_0_OBUF_XORF_128,
      O => F_0_O
    );
  F_1_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD232",
      PATHPULSE => 798 ps
    )
    port map (
      I => F_1_OUTPUT_OFF_O1INV_89,
      O => F_1_O
    );
  F_1_OUTPUT_OFF_O1INV : X_BUF
    generic map(
      LOC => "PAD232",
      PATHPULSE => 798 ps
    )
    port map (
      I => '0',
      O => F_1_OUTPUT_OFF_O1INV_89
    );
  F_2_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD225",
      PATHPULSE => 798 ps
    )
    port map (
      I => F_2_OUTPUT_OFF_O1INV_97,
      O => F_2_O
    );
  F_2_OUTPUT_OFF_O1INV : X_BUF
    generic map(
      LOC => "PAD225",
      PATHPULSE => 798 ps
    )
    port map (
      I => '0',
      O => F_2_OUTPUT_OFF_O1INV_97
    );
  F_3_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD223",
      PATHPULSE => 798 ps
    )
    port map (
      I => F_3_OUTPUT_OFF_O1INV_105,
      O => F_3_O
    );
  F_3_OUTPUT_OFF_O1INV : X_BUF
    generic map(
      LOC => "PAD223",
      PATHPULSE => 798 ps
    )
    port map (
      I => '0',
      O => F_3_OUTPUT_OFF_O1INV_105
    );
  S_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD226",
      PATHPULSE => 798 ps
    )
    port map (
      I => D_11_INBUF,
      O => S_O
    );
  NlwBlock_TOP_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

