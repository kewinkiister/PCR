library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity clk_10Hz is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_10Hz : out STD_LOGIC);
end clk_10Hz;

architecture Behavioral of clk_10Hz is

--constant preset : std_logic_vector(25 downto 0) := "00100110001001011010000000";
constant preset : std_logic_vector(25 downto 0) := "00000000000000000000000011";
signal s_10Hz : std_logic := '0';
signal count : std_logic_vector(25 downto 0) := (others => '0');

begin

clk_10Hz <= s_10Hz;

process (clk, reset)
begin 
    if rising_edge(clk) then
        if reset= '1' then
            s_10Hz <= '0';
            count <= (others => '0');
        elsif count=preset then
            s_10Hz <= not s_10Hz;
            count <= (others => '0');
        else 
            count <= count + '1';
        end if;
    end if;
end process;

end Behavioral;