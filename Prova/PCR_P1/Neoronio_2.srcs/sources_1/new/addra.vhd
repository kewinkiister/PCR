----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2019 09:51:31 AM
-- Design Name: 
-- Module Name: addra - Behavioral
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

use work.fpupack.all;
use work.entities.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addra1 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           addra : out STD_LOGIC_VECTOR (6 downto 0));
end addra1;

architecture Behavioral of addra1 is

constant preset : std_logic_vector(1 downto 0) := "01";
signal s : std_logic := '0';
signal count : std_logic_vector(1 downto 0) := (others => '0');
signal count1 : std_logic_vector(6 downto 0) := (others => '0');
signal preset1 : std_logic_vector(6 downto 0) := "1100100";

begin

process (clk, reset)
begin 
    if rising_edge(clk) then
        if reset= '1' then
            s <= '0';
            count <= (others => '0');
        elsif count=preset then
            s <= not s;
            count <= (others => '0');
        else 
            count <= count + '1';
        end if;
    end if;
end process;

process(clk, reset)
begin
    if rising_edge(clk) then
        if reset='1' then
            count1 <= (others =>'0');
        elsif count1 = preset1 then
            count1 <= (others =>'0');
        else 
            count1 <= count1 + '1';
        end if;
    end if;
 end process;
 
 addra <= count1;
            
end Behavioral;
