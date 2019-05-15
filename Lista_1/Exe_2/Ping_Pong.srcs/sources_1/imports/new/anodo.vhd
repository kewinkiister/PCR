----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2019 11:00:07 AM
-- Design Name: 
-- Module Name: anodo - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity anodo is
    Port ( clk_40Hz : in STD_LOGIC;
           reset : in STD_LOGIC;
           cnt0 : in STD_LOGIC_VECTOR (3 downto 0);
           cnt1 : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           s_bin : out STD_LOGIC_VECTOR (3 downto 0));
end anodo;

architecture Behavioral of anodo is

signal s_an 		: unsigned(3 downto 0) := "0000";
signal sel_mux 	: std_logic_vector(1 downto 0):="00";

begin

	-- process para multiplexar anodos
	process(clk_40Hz,reset)
	begin
		if reset='1' then
			s_an <= "1110";
			sel_mux <= "00";
		elsif rising_edge(clk_40Hz) then
			s_an <= s_an srl 1;
			sel_mux <= sel_mux + 1;
		end if;
	end process;
	
	an <= std_logic_vector(s_an);
	
	-- mux para decodificador
	with sel_mux select
		s_bin <= cnt0 when "00",
					"1111" when "01", 
					"1111" when "10", 
					cnt1 when others; 

end Behavioral;
