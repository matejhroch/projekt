library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity binary_to_morse is

  
port (
    trans_recieve : in    std_logic;
    clk         : in    std_logic;
    ce         : in    std_logic;
    rst         : in    std_logic;
    snd         : in    std_logic;
    morse       : out   std_logic;
    bin         : in    std_logic_vector(6 downto 0)                   
  );
end entity binary_to_morse;

architecture Behavioral of binary_to_morse is

 
  signal sig_cnt   : unsigned(4 downto 0);
  constant c_short0 : unsigned(4 downto 0) := b"0_0001"; -- 0.2
  constant c_short : unsigned(4 downto 0) := b"0_0001"; --0.2
  constant c_long  : unsigned(4 downto 0) := b"0_0011"; --0.6


begin


    
bin_to_morse : process (clk) is
 begin

if(trans_recieve = '1') then -- transmitting
-------------------------------------------------------------------------------------
if(rst = '1') then -- reset

morse <= '0';
sig_cnt <= (others => '0');

 end if; -- reset 
 
 
  
if (rising_edge(clk)) then -- rising edge

 if (ce = '1') then  -- enable
                 
    if (snd = '1') then  -- snd
       case bin is
       	  
-----------------------------------------------------------------------------------------------------------
       when "1000001" =>	-- a 

            	 if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
           
             	 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt  < (2*c_short + c_short0 + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                    
             	 else
           		    morse <= '0';
             
             end if;
-----------------------------------------------------------------------------------------------------------       
         when "1000010" => -- b
		
        		 if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_long + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;     
                                     
             	 elsif ((c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + c_long + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
                    
                 elsif ((2*c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + c_long + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                    
                 elsif ((2*c_short + c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_long + 2*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
                    
                 elsif ((3*c_short + c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_long + 3*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((3*c_short + c_long + 3*c_short0) <= sig_cnt) and (sig_cnt < (4*c_short + c_long + 3*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;               
                    
             	 else
           		    morse <= '0';
             
             end if;
-----------------------------------------------------------------------------------------------------------       
          when "1000011" => -- c     
          
        	 if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_long + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;     
                                     
             	 elsif ((c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + c_long + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
                    
                 elsif ((2*c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + c_long + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                    
                 elsif ((2*c_short + c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_long + 2*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
                    
                 elsif ((2*c_short + 2*c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_long + 3*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + 2*c_long + 3*c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_long + 3*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;               
                    
             	 else
           		    morse <= '0';
             
             end if;  
-----------------------------------------------------------------------------------------------------------                 
          when "1000100" => -- d
          
              	if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_long + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;     
                                     
             	 elsif ((c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + c_long + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
                    
                 elsif ((2*c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + c_long + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                 
                 elsif ((2*c_short + c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < ((3*c_short + c_long + 2*c_short0))) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;                   
                                                                      
                else
           		    morse <= '0';
             
             end if;       
-----------------------------------------------------------------------------------------------------------              
          when "1000101" => -- e
          
           if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                                                 
             	 else
           		    morse <= '0';
             
             end if;
-----------------------------------------------------------------------------------------------------------              
          when "1000110" => -- f
          
         		 if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((3*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;  
                 
                 elsif ((3*c_short + 2*c_short0) <= sig_cnt) and (sig_cnt  < (3*c_short + c_long + 2*c_short0)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((3*c_short + c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_long + 3*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;  
                    
                 elsif ((3*c_short + c_long + 3*c_short0) <= sig_cnt) and (sig_cnt < (4*c_short + c_long + 3*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1; 
                    
                 else
           		    morse <= '0';
             
             end if;   
                      
-----------------------------------------------------------------------------------------------------------                 
          when "1000111" => -- g  
          
        		 if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_long + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                    
                elsif ((c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt  < (c_short + 2*c_long + c_short0)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + 2*c_long + c_short0) <= sig_cnt) and (sig_cnt < (c_short + 2*c_long + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;   
                    
                  elsif ((c_short + 2*c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_long + 2*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1; 
                    
                 else
           		    morse <= '0';
             
             end if;      
          
-----------------------------------------------------------------------------------------------------------           
          when "1001000" => -- h        
          
         	     if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((3*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((3*c_short + 2*c_short0) <= sig_cnt) and (sig_cnt < (4*c_short + 2*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((4*c_short + 2*c_short0) <= sig_cnt) and (sig_cnt < (4*c_short + 3*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                 
                 elsif ((4*c_short + 3*c_short0) <= sig_cnt) and (sig_cnt < (5*c_short + 3*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                                                                     
             	 else
           		    morse <= '0';
             
             end if;
-----------------------------------------------------------------------------------------------------------  
          when "1001001" => -- i                 	
            
            if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
				 
                 else
           		    morse <= '0';
             
             end if;
---------------------------------------------------------------------------------------------------------     
          when "1001010" => -- j                                       
          
           if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
           
             	 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt  < (2*c_short + c_short0 + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                 
                 elsif ((2*c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + 2*c_short0 + c_long) <= sig_cnt) and (sig_cnt  < (2*c_short + 2*c_short0 + 2*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                 
                 elsif ((2*c_short + 2*c_short0 + 2*c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 3*c_short0 + 2*c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + 3*c_short0 + 2*c_long) <= sig_cnt) and (sig_cnt  < (2*c_short + 3*c_short0 + 3*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                                                    
             	 else
           		    morse <= '0';
             
             end if;
          	
---------------------------------------------------------------------------------------------------------      
          when "1001011" => -- k                 
          	
            if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;     
                                     
             	 elsif ((c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0 + c_long)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
                    
                 elsif ((2*c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                 
                 elsif ((2*c_short + 2*c_short0 + c_long) <= sig_cnt) and (sig_cnt  < (2*c_short + 2*c_short0 + 2*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;                
                                                                      
                else
           		    morse <= '0';
             
             end if; 
---------------------------------------------------------------------------------------------------------          
          when "1001100" => -- l                                      	 
          
           if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
           
             	 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt  < (2*c_short + c_short0 + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;  
                    
                 elsif ((2*c_short + 2*c_short0 + c_long) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_short0 + c_long)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1; 
                 
                 elsif ((3*c_short + 2*c_short0 + c_long) <= sig_cnt) and (sig_cnt < (3*c_short + 3*c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;  
                    
                 elsif ((3*c_short + 3*c_short0 + c_long) <= sig_cnt) and (sig_cnt < (4*c_short + 3*c_short0 + c_long)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 else
           		    morse <= '0';
             
             end if;
---------------------------------------------------------------------------------------------------------          
          when "1001101" => -- m
          
          if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                    
                elsif ((c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt  < (c_short + c_short0 + 2*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                                                     
                 else
           		    morse <= '0';
             
             end if;      
          
---------------------------------------------------------------------------------------------------------
          when "1001110" => -- n
           
           	if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;     
                                     
             	 elsif ((c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0 + c_long)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                                                      
                 else
           		    morse <= '0';
             
             end if;   
---------------------------------------------------------------------------------------------------------          
          when "1001111" => -- o
             
             if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;            
           
             	 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                 
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt  < (c_short + c_short0 + 2*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                 
                 elsif ((c_short + c_short0 + 2*c_long) <= sig_cnt) and (sig_cnt < (c_short + 2*c_short0 + 2*c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short + 2*c_short0 + 2*c_long) <= sig_cnt) and (sig_cnt  < (c_short + 2*c_short0 + 3*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                                                    
             	 else
           		    morse <= '0';
             
             end if;
---------------------------------------------------------------------------------------------------------          
          when "1010000" => -- p          
            
            if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                                                       
                 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt  < (2*c_short + c_short0 + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;  
                    
                 elsif ((2*c_short + 2*c_short0 + c_long) <= sig_cnt) and (sig_cnt  < (2*c_short + 2*c_short0 + 2*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + 2*c_short0 + 2*c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 3*c_short0 + 2*c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((2*c_short + 2*c_short0 + 2*c_long) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_short0 + 2*c_long)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1; 
                    
                 else
           		    morse <= '0';
             
             end if;   
---------------------------------------------------------------------------------------------------------          
          when "1010001" => -- q
            
            if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_short + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                    
                elsif ((c_short + c_short + c_long) <= sig_cnt) and (sig_cnt  < (c_short + c_short + 2*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_short + 2*c_long) <= sig_cnt) and (sig_cnt < (c_short + 2*c_short + 2*c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;   
                    
                  elsif ((c_short + 2*c_short + 2*c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_short + 2*c_long)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1; 
                  
                  elsif ((2*c_short + 2*c_short + 2*c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 3*c_short + 2*c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                    
                  elsif ((2*c_short + 3*c_short + 2*c_long) <= sig_cnt) and (sig_cnt  < (2*c_short + 3*c_short + 3*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;  
                    
                 else
           		    morse <= '0';
             
             end if;   
---------------------------------------------------------------------------------------------------------          
          when "1010010" => -- r
          
           if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
           
             	 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt  < (2*c_short + c_short0 + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;  
                    
                 elsif ((2*c_short + 2*c_short0 + c_long) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_short0 + c_long)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;   
                    
             	 else
           		    morse <= '0';
             
             end if;
          
---------------------------------------------------------------------------------------------------------          
          when "1010011" => -- s
          
 			if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((3*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((3*c_short + 2*c_short0) <= sig_cnt) and (sig_cnt < (4*c_short + 2*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                                                                        
                 else
           		    morse <= '0';
             
             end if;
---------------------------------------------------------------------------------------------------------          
          when "1010100" => -- t

  			if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   

                 else
           		    morse <= '0';
             
             end if;   
          
---------------------------------------------------------------------------------------------------------          
          when "1010101" => -- u
          
 			if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((3*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;  
                 
                 elsif ((3*c_short + 2*c_short0) <= sig_cnt) and (sig_cnt  < (3*c_short + c_long + 2*c_short0)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                    
                 else
           		    morse <= '0';
             
             end if;   
---------------------------------------------------------------------------------------------------------          
          when "1010110" => -- v

			if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((3*c_short + c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;  

			elsif ((3*c_short + 2*c_short0) <= sig_cnt) and (sig_cnt < (4*c_short + 2*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((4*c_short + 2*c_short0) <= sig_cnt) and (sig_cnt < (4*c_short + 3*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                 
                 elsif ((4*c_short + 3*c_short0) <= sig_cnt) and (sig_cnt  < (4*c_short + c_long + 3*c_short0)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                    
                 else
           		    morse <= '0';
             
             end if;  
          
---------------------------------------------------------------------------------------------------------          
          when "1010111" => -- w
          
 			if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif (c_short <= sig_cnt) and (sig_cnt < (2*c_short)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
             	 elsif ((2*c_short) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
           
             	 elsif ((2*c_short + c_short0) <= sig_cnt) and (sig_cnt  < (2*c_short + c_short0 + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                 
                 elsif ((2*c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;
                    
                 elsif ((2*c_short + 2*c_short0 + c_long) <= sig_cnt) and (sig_cnt  < (2*c_short + 2*c_short0 + 2*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;
                                                    
             	 else
           		    morse <= '0';
             
             end if;
---------------------------------------------------------------------------------------------------------          
          when "1011000" => -- x
          
			if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_long + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;     
                                     
             	 elsif ((c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + c_long + c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
                    
                 elsif ((2*c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + c_long + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                 
                 elsif ((2*c_short + c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < ((3*c_short + c_long + 2*c_short0))) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;

		    elsif ((3*c_short + c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + c_long + 3*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                 
                 elsif ((3*c_short + c_long + 3*c_short0) <= sig_cnt) and (sig_cnt < ((3*c_short + 2*c_long + 3*c_short0))) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;                    
                                                                      
                else
           		    morse <= '0';
             
             end if;       
---------------------------------------------------------------------------------------------------------          
          when "1011001" => -- y
          
 			if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;     
                                     
             	 elsif ((c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + c_short0 + c_long)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
                    
                    
                 elsif ((2*c_short + c_short0 + c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_short0 + c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                 
                 elsif ((2*c_short + 2*c_short0 + c_long) <= sig_cnt) and (sig_cnt  < (2*c_short + 2*c_short0 + 2*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   

		    elsif ((2*c_short + 2*c_short0 + 2*c_long) <= sig_cnt) and (sig_cnt < (2*c_short + 3*c_short0 + 2*c_long)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                 
                 elsif ((2*c_short + 3*c_short0 + 2*c_long) <= sig_cnt) and (sig_cnt  < (2*c_short + 3*c_short0 + 3*c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;              
                                                                      
                else
           		    morse <= '0';
             
             end if; 
---------------------------------------------------------------------------------------------------------          
          when "1011010" => -- z

 			if (sig_cnt < c_short) then
     
       	       	    morse <= '0';     
        			sig_cnt <= sig_cnt + 1;
                    
                 elsif ((c_short) <= sig_cnt) and (sig_cnt  < (c_short + c_long)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + c_long) <= sig_cnt) and (sig_cnt < (c_short + c_long + c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1; 
                    
                elsif ((c_short + c_long + c_short0) <= sig_cnt) and (sig_cnt  < (c_short + 2*c_long + c_short0)) then
                 
           			morse <= '1';              
        			sig_cnt <= sig_cnt + 1;   
                    
                 elsif ((c_short + 2*c_long + c_short0) <= sig_cnt) and (sig_cnt < (c_short + 2*c_long + 2*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;   
                    
                  elsif ((c_short + 2*c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_long + 2*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1;
 
		      elsif ((2*c_short + 2*c_long + 2*c_short0) <= sig_cnt) and (sig_cnt < (2*c_short + 2*c_long + 3*c_short0)) then
                 
             		morse <= '0';
                    sig_cnt <= sig_cnt + 1;   
                    
                  elsif ((2*c_short + 2*c_long + 3*c_short0) <= sig_cnt) and (sig_cnt < (3*c_short + 2*c_long + 3*c_short0)) then
                 
       	       	    morse <= '1';
        			sig_cnt <= sig_cnt + 1; 
                    
                 else
           		    morse <= '0';
             
             end if;      
-------------------------------------------------------------------------------------------------------------       

          when others => 

          morse <= '0';

        end case;
        
    else 
       
        sig_cnt <= (others => '0');
     
    end if; -- snd
  end if; -- enable
 end if; -- rising edge    
  
 end if; -- transmitting   
  
  end process bin_to_morse;
 
end Behavioral;