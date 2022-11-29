library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture bev of testbench is


component ROM_MEM is
    port(
        clk: in std_logic;
        addr: in std_logic_vector (15 downto 0);
        re: in std_logic;
        dout: out std_logic_vector (7 downto 0)
    );

end component;

signal clk: std_logic:='0';
signal addr: std_logic_vector(15 downto 0) :="0000000000000000";
signal re: std_logic:='0';

signal dout: std_logic_vector(7 downto 0);



-- component mac is
--   Port (din1: in std_logic_vector (7 downto 0);
--         din2: in std_logic_vector (15 downto 0);
--         clk: in std_logic;
--         cntrl: in std_logic;
--         output: out std_logic_vector (15 downto 0));
-- end mac;


-- signal din1: std_logic_vector(7 downto 0) :="00000000";
-- signal din2: std_logic_vector(15 downto 0) :="0000000000000000";
-- signal clk: std_logic:='0';
-- signal cntrl: std_logic:='0';

-- signal output: std_logic_vector(15 downto 0);


begin
    u1: entity work.ROM_MEM PORT MAP (clk,addr,re,dout);

--      u2: entity work.mac PORT MAP (din1,din2,clk,cntrl,output);

-- process
--  begin

--     clk100M_in <= clk;
--     resume <= btnR;
--     pause <= btnC;
--     reset <= btnL;
    

--     running_in <= running;
    
--     clk10 <= clk10_out;
    
--  end process;


	re <= '1';
    addr <= "0000000000000000";
	clk <= '1';
    


end bev;