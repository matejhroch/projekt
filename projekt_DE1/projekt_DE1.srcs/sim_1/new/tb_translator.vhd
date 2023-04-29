
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------
-- Entity declaration for testbench
----------------------------------------------------------

entity tb_translator is
  -- Entity of testbench is always empty
end entity tb_translator;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_translator is

  -- Local constants
  constant c_CLK_100MHZ_PERIOD : time := 10 ns;
  constant c_ce : time := 20 ns;

  -- Local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_trans_recieve : std_logic;
  signal sig_bin		: std_logic_vector(6 downto 0);
  signal sig_ce		: std_logic;
  signal sig_rst        : std_logic;
  signal sig_first      : std_logic_vector(1 downto 0);
  signal sig_second     : std_logic_vector(1 downto 0);
  signal sig_third      : std_logic_vector(1 downto 0);
  signal sig_fourth     : std_logic_vector(1 downto 0);


begin

  -- Connecting testbench signals with tlc entity
  -- (Unit Under Test)
  uut_translator : entity work.translator
    port map (
      clk   => sig_clk_100mhz,
      ce    => sig_ce,
      rst   => sig_rst,
      trans_recieve => sig_trans_recieve,
      first => sig_first,
      second => sig_second,
      third => sig_third,
      fourth => sig_fourth,
      bin    => sig_bin
    );

  --------------------------------------------------------
  -- Clock generation process
  --------------------------------------------------------
  p_clk_gen : process is
  begin

    loop 

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;

    wait;

  end process p_clk_gen;
  
  
   p_ce_gen : process is
  begin

    loop 

      sig_ce <= '0';
      wait for c_ce / 2;
      sig_ce <= '1';
      wait for c_ce / 2;

    end loop;

    wait;

  end process p_ce_gen;
  
  
 

  --------------------------------------------------------
  -- Reset generation process
  --------------------------------------------------------
  p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 43 ns;

    -- Reset activated
    sig_rst <= '1';
    wait for 53 ns;

    -- Reset deactivated
    sig_rst <= '0';
    wait;

  end process p_reset_gen;

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";
    
    sig_trans_recieve <= '0';
    wait for 143 ns;
    sig_first <= "00";
    sig_second <= "01";
    sig_third <= "10";
    sig_fourth <= "10";
    wait for 143 ns;
    sig_first <= "01";
    sig_second <= "00";
    sig_third <= "00";
    sig_fourth <= "00";
    
    
    
    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
