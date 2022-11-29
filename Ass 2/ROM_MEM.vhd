----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/12/2022 04:42:40 PM
-- Design Name: 
-- Module Name: ROM_MEM - Behavioral
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

-- library STD;
use STD.TEXTIO.ALL;
-- use ieee.std_logic_textio.all;
-- use IEEE.STD_LOGIC_arith.ALL;

use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM_MEM is
    generic (
        ADDR_WIDTH : integer := 10;
        DATA_WIDTH : integer := 8;
        IMAGE_SIZE : integer := 784;
        WEIGHT_BIAS_SIZE : integer := 50890;
        IMAGE_FILE_NAME : string :="imgdata_digit7.mif";
        WEIGHT_BIAS_FILE_NAME : string :="weights_bias.mif"
    );

    port(
        clk: in std_logic;
        addr: in std_logic_vector (15 downto 0);
        re: in std_logic;
        dout: out std_logic_vector (7 downto 0)
    );

end ROM_MEM;

architecture Behavioral of ROM_MEM is


    TYPE img_type IS ARRAY(0 TO IMAGE_SIZE-1) OF std_logic_vector((DATA_WIDTH-1) DOWNTO 0);

    impure function init_img(mif_file_name : in string) return img_type is
        file mif_file : text open read_mode is mif_file_name;
        variable mif_line : line;
        variable temp_bv : bit_vector(DATA_WIDTH-1 downto 0);
        variable temp_mem : img_type;
    begin
        for i in img_type'range loop
            readline(mif_file, mif_line);
            read(mif_line, temp_bv);
            temp_mem(i) := to_stdlogicvector(temp_bv);
        end loop;
        return temp_mem;
    end function;



    TYPE weight_bias_type IS ARRAY(0 TO WEIGHT_BIAS_SIZE-1) OF std_logic_vector((DATA_WIDTH-1) DOWNTO 0);

    impure function init_wb(mif_file_name : in string) return weight_bias_type is
        file mif_file : text open read_mode is mif_file_name;
        variable mif_line : line;
        variable temp_bv : bit_vector(DATA_WIDTH-1 downto 0);
        variable temp_mem : weight_bias_type;
    begin
        for i in weight_bias_type'range loop
            readline(mif_file, mif_line);
            read(mif_line, temp_bv);
            temp_mem(i) := to_stdlogicvector(temp_bv);
        end loop;
        return temp_mem;
    end function;


    TYPE rom_type IS ARRAY(0 TO 51913) OF std_logic_vector((DATA_WIDTH-1) DOWNTO 0);


    signal image_block: img_type := init_img(IMAGE_FILE_NAME);

    signal weight_bias_block: weight_bias_type := init_wb(WEIGHT_BIAS_FILE_NAME);

    signal memory: rom_type;


    signal outVec: std_logic_vector (7 downto 0) := "00000000";


begin
    -- //Your ROM code

	process
    begin
    
		for i in 0 to 783 loop
    		memory(i) <= image_block(i);
    	end loop;
    	
    	for i in 784 to 1023 loop
    		memory(i) <= (others=> '0');
    	end loop;
    	
		for i in 1024 to 51913 loop
    		memory(i) <= weight_bias_block(i-1024);
    	end loop;
    
    end process;


    process
    begin

        if(rising_edge(clk) and (re = '1')) then

            outVec <= memory(to_integer(signed(addr)));

        end if;


    end process;

    dout <= outVec;

end Behavioral;