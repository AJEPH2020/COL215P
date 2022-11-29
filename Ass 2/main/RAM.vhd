library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity RAM is
port(
    clk: in std_logic;
    we: in std_logic;
    we_imd: in std_logic;
    re: in std_logic;
    copy: in std_logic;
    adrsdm: in std_logic_vector(10 downto 0);
    Din: in std_logic_vector(15 downto 0);
    
    outputdm: out std_logic_vector(15 downto 0);
    output_imd: out std_logic_vector(15 downto 0)
    );
end entity;


architecture bev of RAM is

type mem is array(0 to 1999) of std_logic_vector(15 downto 0);
--signal addrs_write: integer range 0 to 1999;
--signal addrs_read: integer range 0 to 1999;

SIGNAL dmemory: mem := (others => x"0000");


type imtrmState_type is array(0 to 63) of std_logic_vector(15 downto 0);
SIGNAL imtrmState: imtrmState_type := (others => x"0000");

signal out_stored: std_logic_vector(15 downto 0) := x"0000";

signal imdSavedOut: std_logic_vector(15 downto 0) := x"0000";

begin
	process(clk)
    begin
    
        if(rising_edge(clk)) then
--    		addrs_write <= to_integer(unsigned(adrsdm));
    	    
    	    dmemory(to_integer(unsigned(adrsdm)))<=Din;
    	    
    	end if;
    	    
	end process;
	
	process(we_imd)
    begin
    
    	if(rising_edge(we_imd)) then
--    		addrs_write <= to_integer(unsigned(adrsdm));

    	    imtrmState(to_integer(unsigned(adrsdm)))<=Din;
    	    
    	end if;
    	    
	end process;
	
	
	process(copy)
    begin
        
    	if(rising_edge(copy)) then
--    		addrs_write <= to_integer(unsigned(adrsdm));
        
--    	    for i in 0 to 63 loop
    	       
--    	       dmemory(i) <= imtrmState(i);
----    	       wait for 4ns;
    	       
--    	    end loop;
    	    
    	    imdSavedOut <= imtrmState(to_integer(unsigned(adrsdm)));
    	    
    	end if;
    	    
	end process;
	
	
--	process
--	begin
        
--    		addrs_read <= to_integer(unsigned(adrsdm));
    	    
--    	    out_stored<=dmemory(addrs_read);
----    	    outputdm<="11110" & adrsdm;
----    	    outputdm<="000000000000000" & we;
----    	    outputdm<="0000111100001111";
    	    
--	end process;
	
	output_imd <= imdSavedOut;
	
	outputdm <= dmemory(to_integer(unsigned(adrsdm)));
--	outputdm <= "000000000000000" & we;
--	outputdm <= x"ffff";
	
end bev;

