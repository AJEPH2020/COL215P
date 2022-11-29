library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY RegisterFile IS
PORT(
    clk: IN STD_LOGIC;
    addr: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    Data: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    we: IN STD_LOGIC;
    re: IN STD_LOGIC;

    output: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
end ENTITY;

    
ARCHITECTURE Behavioral OF RegisterFile IS
TYPE Reg IS ARRAY(0 to 15) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Mem : Reg;

begin
process(clk)
begin
	IF(RISING_EDGE(clk)) THEN
		IF(we='1') THEN 
            Mem(CONV_INTEGER(addr))<=Data;
    	end IF;
        
        IF(re='1') THEN 
            output<=Mem(CONV_INTEGER(addr));
        end IF;

    end IF;

end process;
end Behavioral;
