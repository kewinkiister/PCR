----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2019 10:27:34 AM
-- Design Name: 
-- Module Name: seg - Behavioral
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

entity seg7 is
    Port ( s_bin : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0));
end seg7;

architecture Behavioral of seg7 is

begin
	process(s_bin)
	begin
		case s_bin is
			when "0000" => seg <= "11000000";
			when "0001" => seg <= "11111001";
			when "0010" => seg <= "10100100";
			when "0011" => seg <= "10110000";
			when "0100" => seg <= "10011001";
			when "0101" => seg <= "10010010";
			when "0110" => seg <= "10000010";
			when "0111" => seg <= "11111000";
			when "1000" => seg <= "10000000";
			when "1001" => seg <= "10010000";
			when "1111" => seg <= "11111111";
			when others => seg <= "11111111";
		end case;
	end process;

end Behavioral;
