
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------
-- Entity declaration for testbench
----------------------------------------------------------

entity tb_morse_to_binary is
  -- Entity of testbench is always empty
end entity tb_morse_to_binary;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_morse_to_binary is

  -- Local constants
  constant c_CLK_100MHZ_PERIOD : time := 10 ns;
  constant c_CLK_2 : time := 40 ns;

  -- Local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_trans_recieve : std_logic;
  signal sig_morse		: std_logic;
  signal sig_ce		: std_logic;
  signal sig_rst        : std_logic;
  signal sig_first      : std_logic_vector(1 downto 0);
  signal sig_second     : std_logic_vector(1 downto 0);
  signal sig_third      : std_logic_vector(1 downto 0);
  signal sig_fourth     : std_logic_vector(1 downto 0);


begin

  -- Connecting testbench signals with tlc entity
  -- (Unit Under Test)
  uut_tlc : entity work.morse_to_binary
    port map (
      clk   => sig_clk_100mhz,
      rst   => sig_rst,
      trans_recieve => sig_trans_recieve,
      morse => sig_morse,
      first => sig_first,
      second => sig_second,
      third => sig_third,
      fourth => sig_fourth,
	  ce => sig_ce
    );

  --------------------------------------------------------
  -- Clock generation process
  --------------------------------------------------------
  p_clk_gen : process is
  begin

    while now < 1000 ns loop -- 10 usec of simulation

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;

    wait;

  end process p_clk_gen;
  
  
  p_ce_gen : process is
  begin

    while now < 1000 ns loop -- 10 usec of simulation

      sig_ce <= '0';
      wait for c_CLK_2 / 2;
      sig_ce <= '1';
      wait for c_CLK_2 / 2;

    end loop;

    wait;

  end process p_ce_gen;

  --------------------------------------------------------
  -- Reset generation process
  --------------------------------------------------------
  p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 20 ns;

    -- Reset activated
    sig_rst <= '1';
    wait for 30 ns;

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
    wait for 50 ns;
    sig_morse <= '1';
    wait for 150 ns;
    sig_morse <= '0';
    wait for 50 ns;
    sig_morse <= '1';
    wait for 150 ns;
    sig_morse <= '0';
    
    
    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
