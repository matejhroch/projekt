


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity binary_to_morse is
    generic(
        K0 : time := 2 ns
    
    );
    
    port (
         data   : in    std_logic_vector(6 downto 0);
         morse  : out   std_logic
     );
end binary_to_morse;

architecture Behavioral of binary_to_morse is

begin

    case data is
        when "1000001" =>
        morse <= '1'; 
        wait for K0;
        
   
        
        when others;
    end case;
    

end Behavioral;
