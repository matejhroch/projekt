
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           LED16_R : out STD_LOGIC);

end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------
architecture behavioral of top is
  -- No internal signals are needed today:)
begin

  binary_to_morse : entity work.binary_to_morse 
      port map (
          clk      => CLK100MHZ,
          snd      => SW(14),
          morse      => LED16_R,
      
          bin(6) => SW(6),
          bin(5) => SW(5),
          bin(4) => SW(4),
          bin(3) => SW(3),
          bin(2) => SW(2),
          bin(1) => SW(1),
          bin(0) => SW(0)


      );


end architecture behavioral;