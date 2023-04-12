
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;



entity tb_binary_to_morse is
  -- Entity of testbench is always empty
end entity tb_binary_to_morse;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_binary_to_morse is

  -- Testbench local constants
  constant c_CLK_100MHZ_PERIOD : time := 10 ns;

  -- Testench local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_snd        : std_logic;
  signal sig_morse      : std_logic;
  signal sig_bin        : std_logic_vector(6 downto 0);

begin


 p_clk_gen : process is
  begin

    while now < 400 ns loop -- 40 periods of 100MHz clock

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;
    wait;

  end process p_clk_gen;
  -- Connecting testbench signals with driver_7seg_4digits
  -- entity (Unit Under Test)
  uut_binary_to_morse : entity work.binary_to_morse
    port map (
      clk     => sig_clk_100mhz,
      snd     => sig_snd,
      morse   => sig_morse,
      bin   => sig_bin
    );


  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_data_gen : process is
  begin

    report "Stimulus process started";

    sig_snd <= '0';
    sig_bin <= "1000001";
    wait for 10 ns;
    sig_snd <= '1';

    

    report "Stimulus process finished";
    wait;

  end process p_data_gen;
  
  p_stimulus : process is
  begin

    report "Stimulus process started";

    

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;

