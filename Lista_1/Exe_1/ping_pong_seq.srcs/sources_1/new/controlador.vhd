----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2019 09:48:18 AM
-- Design Name: 
-- Module Name: controlador - Behavioral
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

entity controlador is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw0 : in STD_LOGIC;
           sw15 : in STD_LOGIC;
           led : in STD_LOGIC_VECTOR (15 downto 0);
           cnt0 : out STD_LOGIC_VECTOR (3 downto 0);
           cnt1 : out STD_LOGIC_VECTOR (3 downto 0);
           lr : out STD_LOGIC;
           enable : out STD_LOGIC;
           player : out STD_LOGIC);
end controlador;

architecture Behavioral of controlador is

signal s_cnt0 		: std_logic_vector(3 downto 0) := "0000";
signal s_cnt1 		: std_logic_vector(3 downto 0) := "0000";

begin

	process(clk,reset)
	begin
		if reset = '1' then
			s_cnt0 <= "0000";
			s_cnt1 <= "0000";
			lr <= '1';
			enable <= '0'; -- habilita jogo
			player <= '0';
		elsif rising_edge(clk) then
			if s_cnt0 = "1001" or s_cnt1 = "1001" then
				lr <= '1'; -- desloca à esquerda
				enable <= '1'; -- habilita o deslocamento
				player <= '0'; -- player 0 começa
				s_cnt0 <= "0000";
				s_cnt1 <= "0000";
			elsif led="0000000000000001" and sw0 = '1' then
				lr <= '1'; -- desloca à esquerda
				enable <= '1'; -- habilita o deslocamento
			elsif led="0000000000000001" and sw0 = '0' then
				lr <= '1'; -- desloca à esquerda
				enable <= '0'; -- deshabilita o deslocamento
				player <= '1'; -- player 1 joga
				s_cnt1 <= s_cnt1 + 1; -- incrementa placar player 1
			elsif led="0000000000000010" and sw0 = '1' then
				lr <= '0'; -- desloca à direita
				enable <= '0'; -- deshabilita o deslocamento
				player <= '1'; -- player 1 joga
				s_cnt1 <= s_cnt1 + 1; -- incrementa placar player 1	
			elsif led="1000000000000000" and sw15 = '1' then
				lr <= '0'; -- desloca à direita
				enable <= '1'; -- habilita o deslocamento
			elsif led="1000000000000000" and sw15 = '0' then
				enable <= '1'; -- deshabilita o deslocamento	
				player <= '0'; -- player 0 joga
				s_cnt0 <= s_cnt0 + 1;	-- incrementa placar player 0	
            elsif led="0100000000000000" and sw15 = '1' then
				lr <= '1'; -- desloca à esquerda
				enable <= '0'; -- deshabilita o deslocamento	
				player <= '0'; -- player 0 joga
				s_cnt0 <= s_cnt0 + 1;	-- incrementa placar player 0
			end if;		
		end if;
	end process;
    cnt0 <= s_cnt0;
    cnt1 <= s_cnt1;
end Behavioral;
