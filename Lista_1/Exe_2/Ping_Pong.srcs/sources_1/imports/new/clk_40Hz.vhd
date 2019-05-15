library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity clk_40Hz is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_40Hz : out STD_LOGIC);
end clk_40Hz;

architecture Behavioral of clk_40Hz is

--constant preset : std_logic_vector(25 downto 0) := "00001001100010010110100000";
constant preset : std_logic_vector(25 downto 0) := "00000000000000000000000010";

signal s_40Hz : std_logic := '0';
signal count : std_logic_vector(25 downto 0) := (others => '0');

begin

clk_40Hz <= s_40Hz;

process (clk, reset)
begin 
    if rising_edge(clk) then
        if reset= '1' then
            s_40Hz <= '0';
            count <= (others => '0');
        elsif count=preset then
            s_40Hz <= not s_40Hz;
            count <= (others => '0');
        else 
            count <= count + '1';
        end if;
    end if;
end process;

end Behavioral;