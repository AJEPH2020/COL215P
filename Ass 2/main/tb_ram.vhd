library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench_ram is
    port(
        led: out std_logic_vector (15 downto 0);
        led2: out std_logic_vector (15 downto 0)
        );
end testbench_ram;

architecture bev of testbench_ram is


signal clk: std_logic:='0';


component RAM is
port(
    clk: in std_logic;
    we_ram: in std_logic;
    we_imd: in std_logic;
    re_ram: in std_logic;
    adrsdm: in std_logic_vector(10 downto 0);
    Din_ram: in std_logic_vector(15 downto 0);
    
    outputdm: out std_logic_vector(15 downto 0)
    );
end component;

 signal we_ram: std_logic:='0';
 signal we_imd: std_logic:='0';
 signal re_ram: std_logic:='0';
 signal adrsdm: std_logic_vector(10 downto 0) :="00000000000";
 signal Din_ram: std_logic_vector(15 downto 0) :="0000000000000000";

 signal outputdm: std_logic_vector(15 downto 0);


--------------------------------


--signal a: std_logic_vector(7 downto 0);
--signal b: std_logic_vector(15 downto 0);



begin
--    u1: entity work.ROM_MEM PORT MAP (clk,addr_rom,re_rom,dout_rom);

--    u2: entity work.mac PORT MAP (din1,din2,clk,cntrl,output_mac);
    
    u3: entity work.RAM PORT MAP (clk,we_ram,we_imd,re_ram,adrsdm,Din_ram,outputdm);



process
begin

    clk <= '0';

    Din_ram <= "1011111111111110";
    adrsdm <= "00000000001";

	wait for 10ns;
    clk <= '1';
    wait for 10ns;
    led <= outputdm;

    adrsdm <= "00000000010";
   wait for 10ns;

    led2 <= outputdm;

    wait for 10ns;
end process;


end bev;