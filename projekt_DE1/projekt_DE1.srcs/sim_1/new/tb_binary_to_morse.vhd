
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
  constant c_ce : time := 20 ns;

  -- Testench local signals
  signal sig_ce : std_logic;
  signal sig_trans_recieve : std_logic;
  signal sig_rst : std_logic;
  signal sig_clk_100mhz : std_logic;
  signal sig_snd        : std_logic;
  signal sig_morse      : std_logic;
  signal sig_bin        : std_logic_vector(6 downto 0);

begin


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
  
  
 
  uut_binary_to_morse : entity work.binary_to_morse
    port map (
      clk     => sig_clk_100mhz,
      trans_recieve     => sig_trans_recieve,
      ce     => sig_ce,
      snd     => sig_snd,
      morse   => sig_morse,
      bin   => sig_bin,
      rst   => sig_rst
    );


  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_data_gen : process is
  begin

   

    sig_snd <= '0';
    sig_trans_recieve <= '1';
    sig_rst <= '0';
    wait for 20 ns;
    sig_rst <= '1';
    wait for 20 ns;
    sig_rst <= '0';
    sig_bin <= "1000001";
    wait for 20 ns;
    sig_snd <= '1';
    wait for 200 ns;
    sig_snd <= '0';
    wait for 50 ns;
    sig_bin <= "1000010";
    wait for 50 ns;
    sig_snd <= '1';
    wait for 400 ns;
    sig_snd <= '0';

    

    wait;

  end process p_data_gen;
  
  p_stimulus : process is
  begin

    report "Stimulus process started";

    

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;

