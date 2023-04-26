library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



-----------------------------------------
--Jde vpodstate jen o prekladac, kdy vstupni data jsou tecky a carky na poradich 1-4 a rozhodne se co je to za znak v ascii
-----------------------------------------

entity translator is

  
port (
    clk       		 	  : in    std_logic;
    rst       		 	  : in    std_logic;
    ce       		 	  : in    std_logic;
    trans_recieve         : in    std_logic;
    first			      : in    std_logic_vector(1 downto 0);
    second			      : in    std_logic_vector(1 downto 0);
    third			      : in    std_logic_vector(1 downto 0);
    fourth			      : in    std_logic_vector(1 downto 0);
    bin					  : out   std_logic_vector(6 downto 0)
    
  );
end entity translator;

architecture Behavioral of translator is

  
  -- 00 tecka
  -- 01 carka
  -- 10 nic
  -- 11 nevyuzito
  

begin
    
translator : process (clk) is

  begin

    if (trans_recieve = '0') then -- transmit/recieve
    
        if rising_edge(clk) then -- clk
        
          if (ce = '1') then -- ce
        
            if (rst = '1') then
            
                bin <= "0000000";
           
            
            end if;
               
          
---------------------------------------------------------------------------------------------------------------------------------          
          
          	if (first = "00") then  
            
           	 	if (second = "00") then
                  
                   if (third = "00") then
                     
                      if (fourth = "00") then
                        
                        bin <= "1001000"; --h                      
                        
                      elsif (fourth = "01") then

                        bin <= "1010110"; --v    
                        
                      else  
                       
                        bin <= "1010011"; --s
    
  					  end if;
                    
                   elsif (third = "01") then 
    
                      if (fourth = "00") then
                        
                        bin <= "1000110"; --f                   
                                             
                      else  
                       
                        bin <= "1010101"; --u
  
  					  end if;  
                     
                   else 
                     
             		  bin <= "1001001"; -- i
                     
  				   end if; 
            
           		elsif (second = "01") then

                   if (third = "00") then
                     
                      if (fourth = "00") then
                        
                        bin <= "1001100"; --l                                                                    
                        
                      else  
                       
                        bin <= "1010010"; --r
    
  					  end if;
                    
                   elsif (third = "01") then 
    
                      if (fourth = "00") then
                        
                        bin <= "1010000"; --p

					  elsif (fourth = "01") then
                        
                        bin <= "1001010"; --j   
                                             
                      else  
                       
                        bin <= "1010111"; --w
  
  					  end if;  
                     
                   else 
                     
             		  bin <= "1000001"; --a 
                     
  				   end if; 
              
            	else
              
             		bin <= "1000101"; -- e
              
           		end if;  
            
            
          else
            
            	if (second = "00") then
                  
                   if (third = "00") then
                     
                      if (fourth = "00") then
                        
                        bin <= "1000010"; --b                      
                        
                      elsif (fourth = "01") then

                        bin <= "1011000"; --x
                        
                      else  
                       
                        bin <= "1000100"; --d
    
  					  end if;
                    
                   elsif (third = "01") then 
    
                      if (fourth = "00") then
                        
                        bin <= "1000011"; --c

                      elsif (fourth = "01") then

                        bin <= "1011001"; --y
                                             
                      else  
                       
                        bin <= "1001011"; --k
  
  					  end if;  
                     
                   else 
                     
             		  bin <= "1001110"; --n 
                     
  				   end if; 
            
           		elsif (second = "01") then

                   if (third = "00") then
                     
                      if (fourth = "00") then
                        
                        bin <= "1011010"; --z

					  elsif (fourth = "01") then
                        
                        bin <= "1010001"; --q 
                        
                      else  
                       
                        bin <= "1000111"; --g
    
  					  end if;
                    
                   elsif (third = "01") then 
    
                      bin <= "1001111"; --o
                     
                   else 
                     
             		  bin <= "1001101"; --m
                     
  				   end if; 
              
            	else
              
             		bin <= "1010100"; --t 
              
           		end if;
            
            
          end if; 
-------------------------------------------------------------------------------------------------------------------------------------------
            end if; --ce
            
        end if; --clk  
      
    end if; --transrecieve
  
  end process translator;
 
end Behavioral;