
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Package for arithmetic operations

----------------------------------------------------------
-- Entity declaration for clock enable
----------------------------------------------------------

entity clock_enable is
  generic (
    g_MAX : natural := 5 --! Number of clk pulses to generate one enable signal period
  );                       -- Note that there IS a semicolon between generic and port sections
  port (
    clk : in    std_logic; --! Main clock
    rst : in    std_logic; --! High-active synchronous reset
    ce  : out   std_logic  --! Clock enable pulse signal
  );
end entity clock_enable;

------------------------------------------------------------
-- Architecture body for clock enable
------------------------------------------------------------

architecture behavioral of clock_enable is

  -- Local counter
  signal sig_cnt_clk : natural;

begin


  p_clk_enable : process (clk) is
  begin

    if rising_edge(clk) then             
      if (rst = '1') then             
        sig_cnt_clk <= 0;                
        ce      <= '0';                  

     
      elsif (sig_cnt_clk >= (g_MAX - 1)) then
        sig_cnt_clk <= 0;                   
        ce      <= '1';                 
      else
        sig_cnt_clk <= sig_cnt_clk + 1;
        ce      <= '0';
      end if;
    end if;

  end process p_clk_enable;

end architecture behavioral;