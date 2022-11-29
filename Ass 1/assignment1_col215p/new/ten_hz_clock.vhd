----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/05/2022 01:54:10 PM
-- Design Name: 
-- Module Name: ten_hz_clock - Behavioral
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

use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
--use IEEE.math_real.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ten_hz_clock is
  Port ( clk: in std_logic;
         clk10: out std_logic);
end ten_hz_clock;

architecture Behavioral of ten_hz_clock is

    signal count: integer range 0 to 10000000:= 0;
    signal curr_clk10: std_logic:= '0';

begin

    process
    begin
        
        if(rising_edge(clk)) then
            if(count = 4999999) then
                curr_clk10 <= not (curr_clk10);
                count <= 0;
            else
                count <= count + 1;
            end if;
        end if;
        
    end process;
    
    clk10 <= curr_clk10;
    
end Behavioral;
