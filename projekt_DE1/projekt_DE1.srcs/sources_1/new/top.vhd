
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           JA  : out STD_LOGIC;
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
  signal sig_LED : STD_LOGIC_VECTOR(15 DOWNTO 0);
  signal sig_bin : STD_LOGIC_VECTOR(6 DOWNTO 0);

  
  
  
begin
JA <= sig_morse;
LED16_R <= sig_morse;
LED(1) <= sig_LED(1);
LED(2) <= sig_LED(2);
LED(3) <= sig_LED(3);
LED(4) <= sig_LED(4);
LED(5) <= sig_LED(5);
LED(6) <= sig_LED(6);
LED(7) <= sig_LED(7);
LED(8) <= sig_LED(8);
LED(9) <= sig_LED(9);
LED(10) <= sig_LED(10);
LED(11) <= sig_LED(11);
LED(12) <= sig_LED(12);
LED(13) <= sig_LED(13);
LED(14) <= sig_LED(14);
LED(15) <= sig_LED(15);



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
    
    
morse_to_binary : entity work.morse_to_binary
    
    
    port map (
    clk    => CLK100MHZ,   		 	 
    rst    => BTNC,   		 	  
    ce     => sig_ce,  		 	  
    trans_recieve  => SW(15),         
    morse  => BTNL,   		 	 
    first  => sig_first,			     
    second	=>	sig_second,	     
    third   =>	sig_third,		    
    fourth	=>	sig_fourth	     
    );
    
    
    
translator : entity work.translator
    
    
    port map (
    clk    => CLK100MHZ,   		 	  		 	    		 	  
    trans_recieve  => SW(15),           		 	 
    first  => sig_first,			     
    second	=>	sig_second,	     
    third   =>	sig_third,		    
    fourth	=>	sig_fourth,
    bin     =>  sig_bin
	     
    );    
    

end architecture behavioral;