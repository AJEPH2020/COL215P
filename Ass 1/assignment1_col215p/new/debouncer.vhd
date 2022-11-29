----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2022 08:44:09 PM
-- Design Name: 
-- Module Name: debouncer - Behavioral
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

entity debouncer is
  Port (clk250: in std_logic;
        resume: in std_logic;
        pause: in std_logic;
        running: out std_logic);
end debouncer;

architecture Behavioral of debouncer is

    signal ignore_res: std_logic:='0';
    signal ignore_pau: std_logic:='0';
    
    signal run_current: std_logic:='0';

begin

    process
    begin
        
--        if(rising_edge(clk250)) then
        
            if(ignore_res='0') then
                if(resume='1') then
                    
                    run_current <= '1';
                    
                    ignore_res <= '1';
                    
                end if;
            else 
                
                if(resume='0') then
                                
                    ignore_res <= '0';
                                
                end if;
                
            end if;
            
            
            if(ignore_pau='0') then
                if(pause='1') then
                                
                    run_current <= '0';
                                
                   ignore_pau <= '1';
                                
                end if;
             else 
                            
                if(pause='0') then
                                            
                   ignore_pau <= '0';
                                            
                end if;
                            
             end if;
        
--        end if;
    end process;
    
    running <= run_current;

end Behavioral;
