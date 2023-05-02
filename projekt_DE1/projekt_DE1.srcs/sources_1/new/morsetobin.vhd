

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity morse_to_binary is

  
port (
    clk       		 	  : in    std_logic;
    rst       		 	  : in    std_logic;
    trans_recieve         : in    std_logic;
    morse     		 	  : in    std_logic;
    first			      : out    std_logic_vector(1 downto 0);
    second			      : out    std_logic_vector(1 downto 0);
    third			      : out    std_logic_vector(1 downto 0);
    fourth			      : out    std_logic_vector(1 downto 0)
    
    
  );
end entity morse_to_binary;

architecture Behavioral of morse_to_binary is

  signal sig_cnt   : unsigned(26 downto 0);
  signal sig_cnt_por   : unsigned(2 downto 0);
  signal sig_prev   : std_logic;
  signal sig_1st   : std_logic_vector(1 downto 0);
  signal sig_2nd   : std_logic_vector(1 downto 0);
  signal sig_3rd   : std_logic_vector(1 downto 0);
  signal sig_4th   : std_logic_vector(1 downto 0);
  
  -- 00 tecka
  -- 01 carka
  -- 10 nic
  -- 11 nevyuzito
  
  constant c_short : unsigned(26 downto 0) := b"001_1100_1001_1100_0011_1000_0000"; -- 0.2 sec  "000_0000_0011_0000_1101_0100_0000" 001_0011_0001_0010_1101_0000_0000
  constant c_long  : unsigned(26 downto 0) := b"100_0010_1100_0001_1101_1000_0000"; -- 0.6 sec  "000_0000_1001_0010_0111_1100_0000" "011_1001_0011_1000_0111_0000_0000"
  constant c_vlong  : unsigned(26 downto 0) := b"101_1111_0101_1110_0001_0000_0000"; -- 0.8 sec "000_0000_1100_0011_0101_0000_0000" "100_1100_0100_1011_0100_0000_0000

begin
    
morse_to_bin : process (clk) is

  begin

    if (trans_recieve = '0') then -- transmit/recieve
    
 		if rising_edge(clk) then -- rising edge
        
        	if (rst = '1') then -- rst
            
            	sig_cnt <=  b"000_0000_0000_0000_0000_0000_0000";
                sig_cnt_por <= b"001";
                sig_2nd <= "10";
                sig_3rd <= "10";
                sig_4th <= "10";
                sig_1st <= "10";
                first <= sig_1st;
                second <= sig_2nd;
                third <= sig_3rd;
                fourth <= sig_4th;
    
            
            else
            

                
              if (morse = sig_prev) then --prevcheck
                    	
                    sig_cnt <= sig_cnt + 1;                                           
                   	sig_prev <= morse;
                   	if (sig_cnt > c_vlong) then
                   	
                   	            first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                                sig_cnt_por <= b"001";
                                
                   	
                   	end if;
                    
               else
                   	                  
                    if ((sig_cnt > c_long) and (sig_prev = '1')) then -- konec
                    
					   if (sig_cnt_por = b"001") then                                               
                                              
                        	    sig_2nd <= "10";
                            	sig_3rd <= "10";
                            	sig_4th <= "10";
                                
                                -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                            
                       elsif (sig_cnt_por = b"010") then
                            
                            	sig_3rd <= "10";
                            	sig_4th <= "10";
                                
                                 -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                                
                            
                                
                        elsif (sig_cnt_por = b"011") then
                                                        	
                            	sig_4th <= "10";
                                
                                 -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                                
                         
                                
                        elsif (sig_cnt_por = b"100") then
                                                        	                                
                                 -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                                
                        else
                            
                                sig_1st <= "10";
                                sig_2nd <= "10";
                            	sig_3rd <= "10";
                            	sig_4th <= "10";
                                                        	                                
                                 -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                                
                              
                                
                        end if;   
  
                                
                                -- reset
                                
                                sig_cnt_por <= b"001";                                
                                sig_prev <= '0';
                                sig_cnt <= (others => '0');     
                    
                    elsif ((sig_cnt > c_short) and (c_long >= sig_cnt) and (sig_prev = '1')) then -- carka
                             
                             if (sig_cnt_por = 1) then
                             
                             	sig_1st <= "01";
                                
                             elsif (sig_cnt_por = 2) then
                             
                             	sig_2nd <= "01";
                                
                             elsif (sig_cnt_por = 3) then
                             
                             	sig_3rd <= "01";
                                
                             elsif (sig_cnt_por = 4) then
                             
                             	sig_4th <= "01";                         
                             
                             end if;
                             
                             sig_cnt <= (others => '0');
                             
                      elsif (c_short >= sig_cnt) then -- tecka nebo mezera
                          	
                          	 if (sig_prev = '1') then -- tecka
                             
                                  if (sig_cnt_por = 1) then 
                                 
                                    sig_1st <= "00";
                                    
                                 elsif (sig_cnt_por = 2) then
                                 
                                    sig_2nd <= "00";
                                    
                                 elsif (sig_cnt_por = 3) then
                                 
                                    sig_3rd <= "00";
                                    
                                 elsif (sig_cnt_por = 4) then
                                 
                                    sig_4th <= "00";                                                            
                                    
                                 end if;
                                 end if; 
                                 sig_cnt <= (others => '0');                                  
                             
                         else
                                
                                sig_cnt <= (others => '0');
                                
                                                
                                        
                		end if;
                 
                          
                    sig_prev <= morse;
                    
                    if (sig_prev = '1') then
                    
                    sig_cnt_por <= sig_cnt_por + 1; 
                    
                    end if;      
                 	                  	                  	                
                end if;-- prevcheck
                sig_prev <= morse;     
             end if; --rst       
    
    	end if; -- rising edge
        
    end if; -- trans_recieve
  
  end process morse_to_bin;
 

end Behavioral;