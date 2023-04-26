library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-----------------------------------------------------------------------------------------------------------
-- POPIS PROTOZE UZ SE V TOM NEVYZNAM --
--
--      sig_cnt je counter mezery, sig_cntpor je counter poradi pozice tecky nebo carky, sig_prev je hodnota predchozi
--     
--      Mohl by nastat problem kdyby mezera mezi teckou/carkou nebo carkou/teckou byla kratsi nez je delka tecky... to by se pak muselo rozhodovat i podle hodnoty predchoziho znaku... asi by slo overit ifem u podminky pro mezeru... ze tu mezeru jeste podminit tim, ze predchozi stav musi byt 1 a naopak u tecky musi byt predchozi stav 0 ale nevim...
-- 
--      Prvni if rozhoduje jestli je rezim transmitter/reciever... '0' je reciever
--          Pokud je reciever, ceka se na nabeznou hranu hodin
--              Pokud je reset v '1' tak se provede reset (wow)
--              Pokud ne rozhoduje se dal:
--                  Ceka se na enable signal, pokud je '1':
--                      Prvni if:
--                          -Pokud je predchozi stav = aktualnimu, inkrementuje se sig_cnt
--                          -Pokud je predchozi stav rozdilny od aktualniho rozhoduje se podle delky mezery (sig_cnt)
--                           Rozhoduje se od nejvyšší a je použito jen if else, takze by nemela byt kolize (snad xd)
--                              -Pokud je mezera delsi nez konstanta c_long, znamena to konec kodu, rozhoduje se podle poradi (sig_cntpor)
--                                  -Pokud je poradi = 1, vyplni se prvni znak a zbytek se vyplni "10"
--                                  -Pokud je poradi = 2, vyplni se prvni dva.... atd. atd.
--                                  Signaly se prenesou na vystup... je to udelane takto, aby se na vystupu nejak nemohly menit hodnoty (mozna useless)
--                              -Pokud je mezera delsi nez konstanta c_short, znamena to carku, rozhoduje se podle poradi
--                                  -Carka se vyplni na pozici kam ma, na konci se nuluje counter sig_cnt
--                              -Pokud je mezera delsi nez c_short0, jde o tecku a postupuje se obdobne...
--                              -Else -- pokud nic z vyse popsanych neplati, jde o mezeru, takze se resetuje counter mezery a inkrementuje se poradi
--
--
--                                 TO DO LIST -- doresit poradi (asi by se melo resetovat do 1 (jak je ted), ale proverit/vyzkouset)
--                                            -- zkontrolovat resetovani obou counteru...
--                                                  counter delky se resetuje pri detekci mezery takze snad ok
--                                                  counter poradi se resetuje pri odeslani takze snad taky ok
--                                            -- zkontrolovat sig_prev => morse
--


entity morse_to_binary is

  
port (
    clk       		 	  : in    std_logic;
    rst       		 	  : in    std_logic;
    ce       		 	  : in    std_logic;
    trans_recieve         : in    std_logic;
    morse     		 	  : in    std_logic;
    first			      : out    std_logic_vector(1 downto 0);
    second			      : out    std_logic_vector(1 downto 0);
    third			      : out    std_logic_vector(1 downto 0);
    fourth			      : out    std_logic_vector(1 downto 0)
    
    
  );
end entity morse_to_binary;

architecture Behavioral of morse_to_binary is

  signal sig_cnt   : unsigned(4 downto 0);
  signal sig_cnt_por   : unsigned(4 downto 0);
  signal sig_prev   : std_logic;
  signal sig_1st   : std_logic_vector(1 downto 0);
  signal sig_2nd   : std_logic_vector(1 downto 0);
  signal sig_3rd   : std_logic_vector(1 downto 0);
  signal sig_4th   : std_logic_vector(1 downto 0);
  
  -- 00 tecka
  -- 01 carka
  -- 10 nic
  -- 11 nevyuzito
  
  constant c_short0 : unsigned(4 downto 0) := b"0_0000"; -- 0 sec
  constant c_short : unsigned(4 downto 0) := b"0_0001"; -- 0.2 sec carka trojnasobek tecky
  constant c_long  : unsigned(4 downto 0) := b"0_0011"; -- 0.6 sec

begin
    
morse_to_bin : process (clk) is

  begin

    if (trans_recieve = '0') then -- transmit/recieve
    
 		if rising_edge(clk) then -- rising edge
        
        	if (rst = '1') then -- rst
            
            	sig_cnt <= (others => '0');
                sig_cnt_por <= (others => '0');
                sig_prev <= '0';
                sig_2nd <= "10";
                sig_3rd <= "10";
                sig_4th <= "10";
                sig_1st <= "10";
    
            
            end if; -- rst
            
            if (ce = '1') then -- clock_enable

                
              if (morse = sig_prev) then --prevcheck
                    	
                    sig_cnt <= sig_cnt + 1;                                           
                   	sig_prev <= morse;
                    
                else
                   	                  
                    if (sig_cnt > c_long) then -- konec
                    
					case (sig_cnt_por) is
                        
                        	when b"0_0001" =>
                                              
                        	    sig_2nd <= "10";
                            	sig_3rd <= "10";
                            	sig_4th <= "10";
                                
                                -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;                                                                                                                              
                            
                            when b"0_0010" =>
                            
                            	sig_3rd <= "10";
                            	sig_4th <= "10";
                                
                                 -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                                
                            
                                
                            when b"0_0011" =>
                                                        	
                            	sig_4th <= "10";
                                
                                 -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                                
                         
                                
                            when b"0_0100" =>
                                                        	                                
                                 -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                                
                            when others =>
                            
                                sig_1st <= "10";
                                sig_2nd <= "10";
                            	sig_3rd <= "10";
                            	sig_4th <= "10";
                                                        	                                
                                 -- odeslani
                                
                                first <= sig_1st;
                                second <= sig_2nd;
                                third <= sig_3rd;
                                fourth <= sig_4th;
                                
                              
                                
                        end case;   
  
                                
                                -- reset
                                
                                sig_cnt_por <= b"0_0001";
                                sig_prev <= '0';
                                sig_cnt <= (others => '0');     
                    
                    else 
                      	if (sig_cnt > c_short) then -- carka
                             
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
                             
                        else
                          	if (sig_cnt > c_short0) then -- tecka nebo mezera
                          	
                          	 if (sig_prev = '0') then -- tecka
                             
                                  if (sig_cnt_por = 1) then 
                                 
                                    sig_1st <= "00";
                                    
                                 elsif (sig_cnt_por = 2) then
                                 
                                    sig_2nd <= "00";
                                    
                                 elsif (sig_cnt_por = 3) then
                                 
                                    sig_3rd <= "00";
                                    
                                 elsif (sig_cnt_por = 4) then
                                 
                                    sig_4th <= "00";                                                            
                                    
                                 end if; 
                                 sig_cnt <= (others => '0');                                  
                             
                            else
                                sig_cnt_por <= sig_cnt_por + 1; -- mezera
                                sig_cnt <= (others => '0');
                                
                               end if;                 
                            end if;            
                		end if;
                 	end if;
                          
                    sig_prev <= morse;      
                 	                  	                  	                
                end if;-- prevcheck
                    
        	end if; -- clock_enable
    
    	end if; -- rising edge
        
    end if; -- trans_recieve
  
  end process morse_to_bin;
 
end Behavioral;