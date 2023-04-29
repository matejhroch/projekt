
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           JA  : out STD_LOGIC;
           JB  : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           LED16_R : out STD_LOGIC
           );


end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------
architecture behavioral of top is
  signal sig_ce : STD_LOGIC:='0';
  signal sig_morse : STD_LOGIC;
  signal sig_first : STD_LOGIC_VECTOR(1 DOWNTO 0);
  signal sig_second : STD_LOGIC_VECTOR(1 DOWNTO 0);
  signal sig_third : STD_LOGIC_VECTOR(1 DOWNTO 0);
  signal sig_fourth : STD_LOGIC_VECTOR(1 DOWNTO 0);
  signal sig_bin : STD_LOGIC_VECTOR(6 DOWNTO 0);
  signal sig_bin_out: STD_LOGIC_VECTOR(6 DOWNTO 0);

  
  
  
begin
JA <= sig_morse;
LED16_R <= sig_morse;


sig_bin(0) <= SW(0);
sig_bin(1) <= SW(1);
sig_bin(2) <= SW(2);
sig_bin(3) <= SW(3);
sig_bin(4) <= SW(4);
sig_bin(5) <= SW(5);
sig_bin(6) <= SW(6);

LED(0) <= sig_bin(0);
LED(1) <= sig_bin(1);
LED(2) <= sig_bin(2);
LED(3) <= sig_bin(3);
LED(4) <= sig_bin(4);
LED(5) <= sig_bin(5);
LED(6) <= sig_bin(6);

LED(15) <= sig_bin_out(6);
LED(14) <= sig_bin_out(5);
LED(13) <= sig_bin_out(4);
LED(12) <= sig_bin_out(3);
LED(11) <= sig_bin_out(2);
LED(10) <= sig_bin_out(1);
LED(9) <= sig_bin_out(0);







  binary_to_morse : entity work.binary_to_morse 
      port map (
          clk      => CLK100MHZ,
          trans_recieve      => SW(15),
          ce      => sig_ce,
          rst      => BTNC,
          snd      => SW(14),
          morse      => sig_morse,
          bin(0)   => SW(0),
          bin(1)   => SW(1),
          bin(2)   => SW(2),
          bin(3)   => SW(3),
          bin(4)   => SW(4),
          bin(5)   => SW(5),
          bin(6)   => SW(6)
      
     

      );
clock_enable : entity work.clock_enable
    generic map (
      -- 1   @ 10 ns
      -- 25 000 000 @ 250 ms
      g_MAX => 20000000
    )
    port map (
      clk => CLK100MHZ,
      rst => BTNC,
      ce  => sig_ce
    );
    
    
morse_to_binary : entity work.morse_to_binary
    
    
    port map (
    clk    => CLK100MHZ,   		 	 
    rst    => BTNC,   		 	  
    trans_recieve  => SW(15),         
    morse  => JB,   		 	 
    first  => sig_first,			     
    second	=>	sig_second,	     
    third   =>	sig_third,		    
    fourth	=>	sig_fourth	     
    );
    
    
    
translator : entity work.translator
    
    
    port map (
    clk    => CLK100MHZ,
    rst    => BTNC,
    ce    => sig_ce,       		 	  		 	    		 	  
    trans_recieve  => SW(15),           		 	 
    first  => sig_first,			     
    second	=>	sig_second,	     
    third   =>	sig_third,		    
    fourth	=>	sig_fourth,
    bin     =>  sig_bin_out
	     
    );    
    

end architecture behavioral;