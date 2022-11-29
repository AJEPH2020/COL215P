----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/22/2022 03:25:05 PM
-- Design Name: 
-- Module Name: Main - Behavioral
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

entity mux is
--  Port (sw: in STD_LOGIC_VECTOR (3 downto 0);
--        seg: out STD_LOGIC_VECTOR(6 downto 0));
end mux;

architecture Behavioral of mux is

begin

--seg(0) <= sw(3) and sw(2) and sw(1) and sw(0);

--seg(6)<= not(sw(0) or sw(2) or (sw(1) and sw(3)) or((not sw(1)) and (not sw(3))));
--seg(5)<=not((not sw(1)) or ((not sw(2)) and (not sw(3))) or (sw(2) and sw(3)));
--seg(4)<= not(sw(1) or (not sw(2)) or sw(3));
--seg(3)<=not( ((not sw(1)) and (not sw(3))) or (sw(2) and (not sw(3))) or (sw(1) and (not sw(2)) and sw(3)) or ((not sw(1)) and sw(2)) or sw(0));
--seg(2)<=not( ((not sw(1)) and (not sw(3))) or(sw(2) and (not sw(3)))); 
--seg(1)<=not( sw(0) or ((not sw(2)) and  (not sw(3))) or (sw(1) and (not sw(2))) or (sw(1) and (not sw(3))));
--seg(0)<=not( sw(0) or (sw(1) and  (not sw(2))) or ((not sw(1)) and (not sw(2))) or (sw(2) and (not sw(3))));




end Behavioral;
