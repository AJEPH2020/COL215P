library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity processor is
port(clk: in std_logic;
    btnL: in std_logic;
    btnC: in std_logic;
    btnR: in std_logic;
    seg: out std_logic_vector (6 downto 0);
    an: out std_logic_vector (3 downto 0);
    dp: out std_logic);
end processor;

architecture bev of processor is


component stopwatch is
     port (
         clk10: in std_logic;
         running_in: in STD_LOGIC;
         reset: in STD_logic;
         outState4: out std_logic_vector (3 downto 0);
         outState3: out std_logic_vector (3 downto 0);
         outState2: out std_logic_vector (3 downto 0);
         outState1: out std_logic_vector (3 downto 0)
         );
end component;


signal clk10: std_logic:='0';
signal running_in: std_logic:='0';
signal reset: std_logic:='0';

signal outState4: std_logic_vector(3 downto 0);
signal outState3: std_logic_vector(3 downto 0);
signal outState2: std_logic_vector(3 downto 0);
signal outState1: std_logic_vector(3 downto 0);



component decoder is
          Port (
                led_input : in STD_LOGIC_VECTOR(3 downto 0);
                seg_output: out STD_LOGIC_VECTOR(6 downto 0)
          );
end component;


signal led_input: std_logic_vector(3 downto 0) := "0000";

signal seg_output: std_logic_vector(6 downto 0);



component ten_hz_clock is
  Port ( clk100M_in: in std_logic;
         clk10_out: out std_logic);
end component;

signal clk100M_in: std_logic:= '0';

signal clk10_out: std_logic;




component twofifty_hz_clock is
  Port ( clk100M_in: in std_logic;
         clk250_out: out std_logic);
end component;

signal clk250_out: std_logic;




component debouncer is
  Port (clk250_in: in std_logic;
        resume: in std_logic;
        pause: in std_logic;
        running: out std_logic);
end component;


signal clk250_in: std_logic:='0';
signal resume: std_logic:='0';
signal pause: std_logic:='0';
signal running: std_logic;




signal running_bit: integer range 0 to 3:= 0;


begin
     u1: entity work.stopwatch PORT MAP 
(clk10,running_in,reset,outState4,outState3,outState2,outState1);

     u2: entity work.decoder PORT MAP (led_input,seg_output);

     u3: entity work.ten_hz_clock PORT MAP (clk100M_in,clk10_out);
     
     u4: entity work.twofifty_hz_clock PORT MAP (clk100M_in,clk250_out);
     
     u5: entity work.debouncer PORT MAP (clk250_in,resume,pause,running);

 process

 begin

    clk100M_in <= clk;
    resume <= btnR;
    pause <= btnC;
    reset <= btnL;
    

    running_in <= running;
    
    clk10 <= clk10_out;
    
 end process;

process
begin
    
    if(rising_edge(clk250_out)) then
    
    
        if(running_bit = 0) then
            an <= "1110";
            led_input <= outState1;
    
            dp <= '1';
    
            running_bit <= 1;
        end if;
        
        
        if(running_bit = 1) then
            an <= "1101";
            led_input <= outState2;
    
            dp <= '0';
    
            running_bit <= 2;
        end if;
        
        
        if(running_bit = 2) then
            an <= "1011";
            led_input <= outState3;

            dp <= '1';
        
            running_bit <= 3;
        end if;
        
        
        if(running_bit = 3) then
            an <= "0111";
            led_input <= outState4;
        
            dp <= '0';
        
            running_bit <= 0;
        end if;
        
        
    end if;

end process;

seg <= seg_output;

end bev;