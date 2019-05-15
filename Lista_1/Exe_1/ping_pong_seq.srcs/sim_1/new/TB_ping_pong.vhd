library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB is
--  Port ( );
end TB;

architecture Behavioral of TB is
component ping_pong_leds is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw0 : in STD_LOGIC;
           sw15 : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end component;
    
    signal clk: STD_LOGIC;
    signal reset: STD_LOGIC;
    signal ssw0: STD_LOGIC;
    signal ssw15: STD_LOGIC;
    signal seg: STD_LOGIC_VECTOR (7 downto 0);
    signal an: STD_LOGIC_VECTOR (3 downto 0);
    signal led: STD_LOGIC_VECTOR (15 downto 0);
    constant clk_period : time :=20 ns;
begin
    uut: ping_pong_leds port map(
        clk => clk,
        reset => reset,
        sw0 => ssw0,
        sw15 => ssw15,
        seg => seg,
        an => an,
        led => led);
        
           -- Clock process definitions
         CLK_process :process
         begin
              CLK <= '0';
              wait for CLK_period/2;
              CLK <= '1';
              wait for CLK_period/2;
         end process;  
         
         stim_process: process
         begin
            reset <= '1';
            ssw0 <= '0'; 
            ssw15 <= '0'; 
        wait for 20 ns;
            reset <= '0';
            ssw0 <= '0'; 
            ssw15 <= '0';
        wait for 400 ns;
            reset <= '0';
            ssw0 <= '1'; 
            ssw15 <= '0';
        wait for 200 ns;
            reset <= '0';
            ssw0 <= '0'; 
            ssw15 <= '0';
        wait for 1800 ns;
            reset <= '0';
            ssw0 <= '0'; 
            ssw15 <= '1';
        wait for 200 ns;
            reset <= '0';
            ssw0 <= '0'; 
            ssw15 <= '0';
        wait;
        end process;

end Behavioral;