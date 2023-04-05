
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------
architecture behavioral of top is
  -- No internal signals are needed today:)
begin

  --------------------------------------------------------
  -- Instance (copy) of driver_7seg_2digits entity
  --------------------------------------------------------
  driver_seg_2 : entity work.driver_7seg_2digits
      port map (
          clk      => CLK100MHZ,
          rst      => BTNC,
         -- data3(3) => SW(15), to si dorobime potom switch na prepinanie prijem/vysielanie
   

          data(7) => SW(7),
          data(6) => SW(6),
          data(5) => SW(5),
          data(4) => SW(4),

          data(3) => SW(3),
          data(2) => SW(2),
          data(1) => SW(1),
          data(0) => SW(0),

          seg(6) => CA,
          seg(5) => CB,
          seg(4) => CC,
          seg(3) => CD,
          seg(2) => CE,
          seg(1) => CF,
          seg(0) => CG,
         


          -- DIGITS
          dig(1 downto 0) => AN(1 downto 0)
      );

  --------------------------------------------------------
  -- Other settings
  --------------------------------------------------------
  -- Disconnect the top four digits of the 7-segment display
  AN(7 downto 2) <= b"1111";

end architecture behavioral;