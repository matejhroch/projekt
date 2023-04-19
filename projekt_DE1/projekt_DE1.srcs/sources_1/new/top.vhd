
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           JA  : out STD_LOGIC;
           BTNC : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (6 downto 0);
           LED16_R : out STD_LOGIC);

end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------
architecture behavioral of top is
  signal sig_ce : STD_LOGIC:='0';
  signal sig_morse : STD_LOGIC;
begin
JA <= sig_morse;
LED16_R <= sig_morse;


  binary_to_morse : entity work.binary_to_morse 
      port map (
          clk      => CLK100MHZ,
          trans_recieve      => SW(15),
          ce      => sig_ce,
          rst      => BTNC,
          snd      => SW(14),
          morse      => sig_morse,
      
          bin(6) => SW(6),
          bin(5) => SW(5),
          bin(4) => SW(4),
          bin(3) => SW(3),
          bin(2) => SW(2),
          bin(1) => SW(1),
          bin(0) => SW(0)


      );
clock_enable : entity work.clock_enable
    generic map (
      -- 1   @ 10 ns
      -- 25 000 000 @ 250 ms
      g_MAX => 25000000
    )
    port map (
      clk => CLK100MHZ,
      rst => BTNC,
      ce  => sig_ce
    );

end architecture behavioral;