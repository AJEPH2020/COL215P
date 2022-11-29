library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity processor is 
end entity processor;

architecture bev of processor is
  component stopwatch is
    port (
      clk : in std_logic;
      resume : in std_logic;
      reset : in std_logic;
      outState4 : out std_logic_vector (3 downto 0);
      outState3 : out std_logic_vector (3 downto 0);
      outState2 : out std_logic_vector (3 downto 0);
      outState1 : out std_logic_vector (3 downto 0)
    );
  end component;
  signal clk : std_logic := '0';
  signal resume : std_logic := '0';
  signal reset : std_logic := '0';

  signal outState4 : std_logic_vector(3 downto 0);
  signal outState3 : std_logic_vector(3 downto 0);
  signal outState2 : std_logic_vector(3 downto 0);
  signal outState1 : std_logic_vector(3 downto 0);

  component decoder is
    port (
      sw : in std_logic_vector(3 downto 0);
      seg : out std_logic_vector(6 downto 0)
    );
  end component;
  signal sw : std_logic_vector(3 downto 0) := "0000";

  signal seg : std_logic_vector(6 downto 0);

begin
  u1 : entity work.stopwatch port map (clk, resume, reset, outState4, outState3, outState2, outState1);

  clk_cycle : process
  begin
    clk <= '1';
    wait for 100 ns;
    clk <= '0';
    wait for 100 ns;
  end process;

  process

  begin

    reset <= '1';
    reset <= '0';
    resume <= '1';
    wait for 10 ns;

    sw <= outState1;
    -- 	wait for 10 ns;
    
    wait;
  end process;
end bev;