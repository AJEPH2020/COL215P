----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/12/2022 03:59:14 PM
-- Design Name: 
-- Module Name: mac - Behavioral
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
use IEEE.STD_LOGIC_arith.ALL;

use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mac is
  Port (din1: in std_logic_vector (7 downto 0);
        din2: in std_logic_vector (15 downto 0);
        clk: in std_logic;
        cntrl: in std_logic;
        output: out signed (15 downto 0));
end mac;

architecture Behavioral of mac is

    signal a: signed(7 downto 0);
    signal b: signed(15 downto 0);

    signal mul: signed(23 downto 0);
    
    signal sum: signed (15 downto 0);
    
begin
    process
    begin
        if (rising_edge(clk)) then
        
            a <= signed(din1);
            b <= signed(din2);
            
            mul <= a * b;
            
            if (cntrl='1') then
                sum <= mul(15 downto 0);
            else
                sum <= sum + mul(15 downto 0);
            end if;
        
        end if;
    end process;

    output <= sum;

end Behavioral;