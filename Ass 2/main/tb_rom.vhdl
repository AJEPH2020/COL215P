library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench_rom is
    port(
        led: out std_logic_vector (15 downto 0)
--        led2: out std_logic_vector (15 downto 0);
--        led3: out std_logic_vector (15 downto 0);
--        img_mem: out std_logic_vector (15 downto 0);
--        wt_mem: out std_logic_vector (15 downto 0)
        );
end testbench_rom;

architecture bev of testbench_rom is


component ROM_MEM is
    port(
        clk: in std_logic;
        addr_rom: in std_logic_vector (15 downto 0);
        re_rom: in std_logic;
        dout_rom: out std_logic_vector (7 downto 0)
    );
end component;

signal clk: std_logic:='0';
signal addr_rom: std_logic_vector(15 downto 0) :="0000000000000000";
signal re_rom: std_logic:='0';

signal dout_rom: std_logic_vector(7 downto 0);



-- component mac is
--   Port (din1: in std_logic_vector (7 downto 0);
--         din2: in std_logic_vector (15 downto 0);
--         clk: in std_logic;
--         cntrl: in std_logic;
--         output_mac: out std_logic_vector (15 downto 0));
-- end component;


-- signal din1: std_logic_vector(7 downto 0) :="00000000";
-- signal din2: std_logic_vector(15 downto 0) :="0000000000000000";
-- signal cntrl: std_logic:='0';

-- signal output_mac: std_logic_vector(15 downto 0);



--component RAM is
--port(
--    clk: in std_logic;
--    we_ram: in std_logic;
--    we_imd: in std_logic;
--    re_ram: in std_logic;
--    adrsdm: in std_logic_vector(10 downto 0);
--    Din_ram: in std_logic_vector(15 downto 0);
--    outputdm: out std_logic_vector(15 downto 0)
--    );
--end component;

-- signal we_ram: std_logic:='0';
-- signal we_imd: std_logic:='0';
-- signal re_ram: std_logic:='0';
-- signal adrsdm: std_logic_vector(10 downto 0) :="00000000000";
-- signal Din_ram: std_logic_vector(15 downto 0) :="0000000000000000";

-- signal outputdm: std_logic_vector(15 downto 0);


--------------------------------


--signal a: std_logic_vector(7 downto 0);
--signal b: std_logic_vector(15 downto 0);



begin
    u1: entity work.ROM_MEM PORT MAP (clk,addr_rom,re_rom,dout_rom);

--    u2: entity work.mac PORT MAP (din1,din2,clk,cntrl,output_mac);
    
--    u3: entity work.RAM PORT MAP (clk,we_ram,we_imd,re_ram,adrsdm,Din_ram,outputdm);


    clk <= not clk;


-- process
--  begin

--     clk100M_in <= clk;
--     resume <= btnR;
--     pause <= btnC;
--     reset <= btnL;
    

--     running_in <= running;
    
--     clk10 <= clk10_out;
    
--  end process;


	re_rom <= '1';
    addr_rom <= "0000000000000000";
--    wait for 100ns;
    
    led <= "00000000" & dout_rom;
    
--    din1 <= "00000010";
--    din2 <= "0000000000000011";
    
--    cntrl <= '1';
    
--	clk <= '1';
    
--    led <= output_mac;
--    led <= "0000000000000101";


--re_ram <= '1';

--adrsdm <= "00000000001";

--led <= outputdm;


--process
--begin
    
--    re_rom <= '1';
    
--    we_ram <= '1';
    
--    for i in 0 to 783 loop        
        
--        addr_rom <= std_logic_vector(to_unsigned(i,addr_rom'length));
        
--        if(dout_rom(7) = '0') then
----            Din_ram <= "00000000" & dout_rom;
--    	    Din_ram <= "00000000" & "00001111";
--        else
----        	Din_ram <= "11111111" & dout_rom;
--        	Din_ram <= "11111111" & "00001111";
--    	end if;
    	
--    	adrsdm <= std_logic_vector(to_unsigned(i,adrsdm'length));
    	
--    	clk <= not clk;
--        wait for 100ns;
    	
--    end loop;
    
--    --------------------------------------------------------------
--    re_ram <= '1';

--    adrsdm <= std_logic_vector(to_unsigned(231,adrsdm'length));

--    clk <= not clk;
--    wait for 100ns;

--    img_mem <= outputdm;
--    --------------------------------------------------------------
    
    
----    for i in 0 to 63 loop        
        
--        re_rom <= '1';
    
--        we_ram <= '1';
    
--        for j in 0 to 783 loop        
        
--            addr_rom <= std_logic_vector(to_unsigned(1024+0*784+j,addr_rom'length));
        
----           Din_ram <= "00000000" & dout_rom;
--    	   Din_ram <= "0000000000001010";
    	
--    	   adrsdm <= std_logic_vector(to_unsigned(1000+j,adrsdm'length));
    	
--    	   clk <= not clk;
--            wait for 100ns;
    	
--        end loop;
        
        
--        ---------------------------------------------------------
        
--        re_ram <= '1';

--        adrsdm <= std_logic_vector(to_unsigned(1231,adrsdm'length));

--        clk <= not clk;
--        wait for 100ns;

--        wt_mem <= outputdm;
        
--        re_ram <= '0';
        
--        ---------------------------------------------------------
        
        
--        we_ram <= '0';
        
--        re_ram <= '1';
        
----        adrsdm <= "00000000000";
--        adrsdm <= std_logic_vector(to_unsigned(0,adrsdm'length));
        
--        clk <= not clk;
--        wait for 100ns;
--        a <= outputdm(7 downto 0);
        
----        adrsdm <= "01111101000";
--        adrsdm <= std_logic_vector(to_unsigned(1000,adrsdm'length));
        
--        clk <= not clk;
--        wait for 100ns;
--        b <= outputdm;
        
        
--        cntrl <= '1';
--        din1 <= a;
--        din2 <= b;
        
--        clk <= not clk;
        
--        ---------------------------------------------------------
--        adrsdm <= std_logic_vector(to_unsigned(0,adrsdm'length));
--        led <= outputdm;
--        led2 <= din2;
        
--        led3 <= output_mac;
--        ---------------------------------------------------------
        
--        cntrl <= '0';
        
--        for j in 1 to 783 loop        
        
----            adrsdm <= "00000000000";
--            adrsdm <= std_logic_vector(to_unsigned(j,adrsdm'length));
--            a <= outputdm(7 downto 0);
        
----            adrsdm <= "01111101000";
--            adrsdm <= std_logic_vector(to_unsigned(1000+j,adrsdm'length));
--            b <= outputdm;
        
--            din1 <= a;
--            din2 <= b;
    	
--    	    clk <= not clk;
    	
--        end loop;
        
        
        
        
----        led <= output_mac;
        
    	
----    end loop;
    
    
    
--end process;


end bev;