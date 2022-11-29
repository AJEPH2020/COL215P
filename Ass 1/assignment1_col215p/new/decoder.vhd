----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/29/2022 02:59:31 PM
-- Design Name: 
-- Module Name: decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
  Port ( sw : in STD_LOGIC_VECTOR(3 downto 0);
         seg: out STD_LOGIC_VECTOR(6 downto 0)
  );
end decoder;

architecture Behavioral of decoder is

--signal curr_segout: STD_LOGIC_VECTOR(6 downto 0):= "0000000";

begin

--process
--begin
seg(6)<= NOT(sw(3) OR sw(1) OR (sw(2) AND sw(0)) OR (NOT sw(2) AND NOT
sw(0)));
seg(5)<= NOT(NOT sw(2) OR (NOT sw(1) AND NOT sw(0)) OR (sw(1) AND 
sw(0)));
seg(4)<= NOT(sw(2) or not sw(1) or sw(0));
seg(3)<= NOT((not sw(2) and not sw(0)) or ( sw(1) and not sw(0)) or 
(sw(2)
and not sw(1) and sw(0) ) or (not sw(2) and sw(1
) ) or sw(3));
seg(2)<= NOT((not sw(2) and not sw(0) ) or (sw(1) and not sw(0)));
seg(1)<= NOT(sw(3) or (not sw(1) and not sw(0)) or ( sw(2) and not sw(1) 
)
or (sw(2) and not sw(0)));
seg(0)<= NOT(sw(3) or (sw(2) and not sw(1) ) or (not sw(2) and sw(1) ) 
or
( sw(1) and not sw(0)));
--end process;

--seg <= curr_segout;

end Behavioral;
