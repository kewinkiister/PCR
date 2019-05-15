----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2019 09:25:01 AM
-- Design Name: 
-- Module Name: deslocamento - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity deslocamento is
    Port ( clk_10Hz : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           lr : in STD_LOGIC;
           player : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (15 downto 0));
end deslocamento;

architecture Behavioral of deslocamento is

signal reg 			: std_logic_vector(15 downto 0) := (others=>'0');

begin

	process(clk_10Hz,reset)
	begin
		if reset='1' then
			reg <= "0000000000000001";
		elsif rising_edge(clk_10Hz) then
			if enable = '1' then
				if lr = '0' then
					reg <= '0' & reg(15 downto 1);
				else
					reg <= reg(14 downto 0) & '0';
				end if;
			elsif player = '0' then
				reg <= "0000000000000001";
			else
				reg <= "1000000000000000";
			end if;
		end if;
	end process;
	led <= reg;

end Behavioral;
