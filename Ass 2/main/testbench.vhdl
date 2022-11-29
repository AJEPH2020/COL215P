library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench is
    port(
        led: out std_logic_vector (15 downto 0)
        );
end testbench;

architecture bev of testbench is


component ROM_MEM is
    port(
        clk_rom: in std_logic;
        addr_rom: in std_logic_vector (15 downto 0);
        re_rom: in std_logic;
        dout_rom: out std_logic_vector (7 downto 0)
    );
end component;

signal clk_rom: std_logic:='0';
signal addr_rom: std_logic_vector(15 downto 0) :="0000000000000000";
signal re_rom: std_logic:='0';

signal dout_rom: std_logic_vector(7 downto 0);



 component mac is
   Port (din1: in std_logic_vector (7 downto 0);
         din2: in std_logic_vector (15 downto 0);
         clk_mac: in std_logic;
         cntrl: in std_logic;
         output_mac: out std_logic_vector (15 downto 0));
 end component;

 signal clk_mac: std_logic:='0';
 signal din1: std_logic_vector(7 downto 0) :="00000000";
 signal din2: std_logic_vector(15 downto 0) :="0000000000000000";
 signal cntrl: std_logic:='0';

 signal output_mac: std_logic_vector(15 downto 0);



component RAM is
port(
    clk_ram: in std_logic;
    we_ram: in std_logic;
    we_imd: in std_logic;
    re_ram: in std_logic;
    copy_ram: in std_logic;
    adrsdm: in std_logic_vector(10 downto 0);
    Din_ram: in std_logic_vector(15 downto 0);
    outputdm: out std_logic_vector(15 downto 0);
    output_imd: out std_logic_vector(15 downto 0)
    );
end component;

 signal clk_ram: std_logic:='0';
 signal we_ram: std_logic:='0';
 signal we_imd: std_logic:='0';
 signal re_ram: std_logic:='0';
 signal copy_ram: std_logic:='0';
 signal adrsdm: std_logic_vector(10 downto 0) :="00000000000";
 signal Din_ram: std_logic_vector(15 downto 0) :="0000000000000000";

 signal outputdm: std_logic_vector(15 downto 0);
 signal output_imd: std_logic_vector(15 downto 0);



component comparator is
port(
    clk_comp: in std_logic;
    en_comp: in std_logic;
    input_comp: in signed(15 downto 0);
    
    output_comp: out signed(15 downto 0)
    );
end component;


 signal clk_comp: std_logic:='0';
 signal en_comp: std_logic:='0';
 signal input_comp: signed(15 downto 0) :="0000000000000000";

 signal output_comp: signed(15 downto 0);



component shifter is
port(
    clk_sftr: in std_logic;
    en_sftr: in std_logic;
    input_sftr: in signed(15 downto 0);
    output_sftr: out signed(15 downto 0)
    );
end component;

 signal clk_sftr: std_logic:='0';
 signal en_sftr: std_logic:='0';
 signal input_sftr: signed(15 downto 0) :="0000000000000000";

 signal output_sftr: signed(15 downto 0);



component RegisterFile IS
PORT(
    clk_rf: IN STD_LOGIC;
    addr_rf: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    Data_rf: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    we_rf: IN STD_LOGIC;
    re_rf: IN STD_LOGIC;

    output_rf: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
end component;

 signal clk_rf: std_logic:='0';
 signal addr_rf: std_logic_vector(3 downto 0):="0000";
 signal Data_rf: std_logic_vector(15 downto 0) :="0000000000000000";
 signal we_rf: std_logic:='0';
 signal re_rf: std_logic:='0';

 signal output_rf: std_logic_vector(15 downto 0);


--------------------------------


signal a: std_logic_vector(7 downto 0);
signal b: std_logic_vector(15 downto 0);

signal x: std_logic_vector(15 downto 0);
signal y: std_logic_vector(15 downto 0);



begin
    u1: entity work.ROM_MEM PORT MAP (clk_rom,addr_rom,re_rom,dout_rom);

    u2: entity work.mac PORT MAP (din1,din2,clk_mac,cntrl,output_mac);
    
    u3: entity work.RAM PORT MAP (clk_ram,we_ram,we_imd,re_ram,copy_ram,adrsdm,Din_ram,outputdm,output_imd);
    
    u4: entity work.comparator PORT MAP (clk_comp,en_comp,input_comp,output_comp);
    
    u5: entity work.shifter PORT MAP (clk_sftr,en_sftr,input_sftr,output_sftr);
    
    u6: entity work.RegisterFile PORT MAP (clk_rf,addr_rf,Data_rf,we_rf,re_rf,output_rf);



process
begin
    clk_rom <= '1';
    wait for 4ns;
    
    clk_rom <= '0';
    wait for 4ns;
    
    
    ---- loading 1x784 image in local memory ----
    for i in 0 to 783 loop        
        clk_ram <= '0';
        wait for 4ns;
        
        addr_rom <= std_logic_vector(to_unsigned(i,addr_rom'length));
        wait for 4ns;
        
        if(dout_rom(7) = '0') then
            Din_ram <= "00000000" & dout_rom;
--    	    Din_ram <= "00000000" & "00001111";
        else
        	Din_ram <= "11111111" & dout_rom;
--        	Din_ram <= "11111111" & "00001111";
    	end if;
    	
    	adrsdm <= std_logic_vector(to_unsigned(i,adrsdm'length));
    	wait for 4ns;
    	
    	clk_ram <= '1';
        wait for 4ns;
    	
    end loop;
    
    clk_ram <= '0';
    wait for 4ns;
    
    -----for all 1x64 intrtmidiate layer-----
    for i in 0 to 63 loop        
        
        ---- loading ith weight column in local memory ----
        for j in 0 to 783 loop
        
            clk_ram <= '0';
            wait for 4ns;
        
            addr_rom <= std_logic_vector(to_unsigned(1024+i*784+j,addr_rom'length));
            wait for 4ns;

            if(dout_rom(7) = '0') then
                Din_ram <= "00000000" & dout_rom;
    --    	    Din_ram <= "00000000" & "00001111";
            else
                Din_ram <= "11111111" & dout_rom;
    --        	Din_ram <= "11111111" & "00001111";
            end if;
    	
    	    adrsdm <= std_logic_vector(to_unsigned(1000+j,adrsdm'length));
    	    wait for 4ns;
    	
    	    clk_ram <= '1';
            wait for 4ns;
    	
        end loop;
        
        clk_ram <= '0';
        wait for 4ns;
        
        --------- first multiplucation with cntrl='1' in mac ---------
        
        
        adrsdm <= std_logic_vector(to_unsigned(0,adrsdm'length));
        wait for 4ns;
        
        a <= outputdm(7 downto 0);
        wait for 4ns;
        
        
        adrsdm <= std_logic_vector(to_unsigned(1000,adrsdm'length));
        wait for 4ns;
        
        b <= outputdm;
        wait for 4ns;
        
        
        cntrl <= '1';
        din1 <= a;
        din2 <= b;
        wait for 4ns;
        
        clk_mac <= '1';
        wait for 4ns;
        
        clk_mac <= '0';
        wait for 4ns;
        
        
        --------- rest multiplications with cntrl='0' for accumilation ---------
        
        cntrl <= '0';
        wait for 4ns;
        
        for j in 1 to 783 loop        
        
            adrsdm <= std_logic_vector(to_unsigned(j,adrsdm'length));
            wait for 4ns;
            a <= outputdm(7 downto 0);
            wait for 4ns;
        
            adrsdm <= std_logic_vector(to_unsigned(1000+j,adrsdm'length));
            wait for 4ns;
            b <= outputdm;
            wait for 4ns;
        
            din1 <= a;
            din2 <= b;
            wait for 4ns;
    	
            clk_mac <= '1';
            wait for 4ns;
            
            clk_mac <= '0';
            wait for 4ns;
    	
    	
        end loop;
        wait for 4ns;


        -------- storing final sum value in imtrmState block(1x64) in ram --------
        
        Din_ram <= output_mac;
    	adrsdm <= std_logic_vector(to_unsigned(i,adrsdm'length));
    	wait for 4ns;
    	
    	we_imd <= '1';
        wait for 4ns;
        
        we_imd <= '0';
        wait for 4ns;
    	
    	--------------------------------------------------------------------------
    	
    end loop;
    
    
    ------ adding bias to 1x64 byte output -------
    
    
        for j in 0 to 63 loop
        
            copy_ram <= '0';
            wait for 4ns;
        
            addr_rom <= std_logic_vector(to_unsigned(51200+j,addr_rom'length));
            wait for 4ns;
            if(dout_rom(7) = '0') then
                x <= "00000000" & dout_rom;
            else
                x <= "11111111" & dout_rom;
            end if;
    	
    	    adrsdm <= std_logic_vector(to_unsigned(j,adrsdm'length));
    	    wait for 4ns;
    	
    	    copy_ram <= '1';
            wait for 4ns;
    	
    	    y <= output_imd;
    	    wait for 4ns;
    	    
    	    
    	    Din_ram <= x + y;
    	    wait for 4ns;
    	    
    	    ----- comparator -----
    	    
    	    input_comp <= signed(Din_ram);
    	    wait for 4ns;
    	    
    	    clk_comp <= '1';
    	    wait for 4ns;
    	    
    	    Din_ram <= std_logic_vector(output_comp);
    	    wait for 4ns;
    	    
    	    clk_comp <= '0';
    	    wait for 4ns;
    	    
    	    
    	    ----- shifter -----
    	    
    	    input_sftr <= signed(Din_ram);
    	    wait for 4ns;
    	    
    	    clk_sftr <= '1';
    	    wait for 4ns;
    	    
    	    Din_ram <= std_logic_vector(output_sftr);
    	    wait for 4ns;
    	    
    	    clk_sftr <= '0';
    	    wait for 4ns;
    	    
    	    
    	    
    	    
    	    ---------- updating imtrmState after relu and shifting ----------
    	    we_imd <= '1';
    	    wait for 4ns;
    	    
    	    we_imd <= '0';
    	    wait for 4ns;
    	    
    	    
    	
        end loop;
        
        copy_ram <= '0';
        wait for 4ns;
    
    
        ----- checking the first block from 1x64 in intermediate state -----
        adrsdm <= std_logic_vector(to_unsigned(60,adrsdm'length));
    	wait for 4ns;
        
        copy_ram <= '1';
        wait for 4ns;
        
        led <= output_imd;
        wait for 4ns;
        
        copy_ram <= '0';
        wait for 4ns;
        
        
    ---------------*****************************************************-----------------
    
    
end process;


end bev;