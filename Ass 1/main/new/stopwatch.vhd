----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/29/2022 02:57:41 PM
-- Design Name: 
-- Module Name: stop_watch - Behavioral
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

use IEEE.numeric_std.all;

use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity stopwatch is
  Port (
       clk: in std_logic;
        resume: in STD_LOGIC;
        reset: in STD_logic;
        outState4: out std_logic_vector (3 downto 0);
        outState3: out std_logic_vector (3 downto 0);
        outState2: out std_logic_vector (3 downto 0);
        outState1: out std_logic_vector (3 downto 0)
        );
end stopwatch;

architecture Behavioral of stopwatch is

--    signal clk: std_logic := '1';
    
    signal curState4, curState3, curState2, curState1 : std_logic_vector (3 downto 0) := "0000";

begin

--    clk <= not clk after 100ms;
    
    
   process(clk, reset, resume)
    -- process(reset, resume)
        begin
        if(reset='1') then 
        
            curState4 <= (others=> '0');
            curState3 <= (others=> '0');
            curState2 <= (others=> '0');
            curState1 <= (others=> '0');
            
       elsif (resume = '1' and rising_edge(clk)) then
        -- elsif (resume = '1') then
            
            if curState1="1001" then curState1<="0000";
                if curState2="1001" then curState2<="0000";
                    if curState3="0101" then curState3<="0000";
                        if curState4="1001" then curState4<="0000";
                        else curState4 <= curState4 + 1; end if;
                    else curState3 <= curState3 + 1; end if;
               else curState2 <= curState2 + 1; end if;
            else curState1 <= curState1 + 1; end if;
        end if;
    end process;

    outState4 <= curState4;
    outState3 <= curState3;
    outState2 <= curState2;
    outState1 <= curState1;

end Behavioral;
