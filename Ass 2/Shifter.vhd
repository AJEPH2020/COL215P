library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;

entity shifter is
port(
    clk: in std_logic;
    en: in std_logic;
    input: in signed(15 downto 0);
    output: out signed(15 downto 0);
    );
end entity;


architecture bev of shifter is

    signal last: signed(15 downto 0) := "0000000000000000";

begin
	process
    begin
    	if(rising_edge(clk)) then

            if(en = '1') then

    		    last <= "00000" & input(15 downto 5);

            else
            
                last <= input;

            end if;

		end if;
	end process;

    output <= last;

end bev;

