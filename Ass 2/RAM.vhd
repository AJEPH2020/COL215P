library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity RAM is
port(
    clk: in std_logic;
    we: in std_logic;
    re: in std_logic;
    adrsdm: in std_logic_vector(5 downto 0);
    Din: in std_logic_vector(15 downto 0);
    outputdm: out std_logic_vector(15 downto 0)
    );
end entity;


architecture bev of RAM is

type mem is array(0 to 999) of std_logic_vector(15 downto 0);
signal addrs: integer range 0 to 999;

SIGNAL dmemory: mem;


begin
	process
    begin
    	if(rising_edge(clk)) then
    		addrs<=to_integer(unsigned(adrsdm));

            if (re = '1') then
    	    	outputdm<=dmemory(addrs);
    	    end if;
    	    
    	    if (we = '1') then
    	    	dmemory(addrs)<=Din;
    	    end if;
		end if;
	end process;
end bev;

