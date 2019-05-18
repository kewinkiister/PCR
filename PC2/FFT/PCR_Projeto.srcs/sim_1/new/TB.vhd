----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2019 07:58:38 AM
-- Design Name: 
-- Module Name: TB - Behavioral
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

entity TB is
--  Port ( );
end TB;

architecture Behavioral of TB is

component FFT is
    Port ( CLK : in STD_LOGIC;
           Start : in STD_LOGIC;
           Xout : out STD_LOGIC_VECTOR (0 to 15);
           Ready: out STD_LOGIC);
end component;

    signal clk : std_logic;
    signal start : std_logic;
    signal xout : std_logic_vector (0 downto 15);
    signal ready : std_logic;
begin

    uut: FFT port map(
        CLK => clk,
        Start => start,
        Xout => xout,
        Ready => ready);

  -- Clock process definitions
 CLK_process :process
 begin
      CLK <= '0';
      wait for 5 ns;
      CLK <= '1';
      wait for 5 ns;
 end process;  

stim_process: process
    begin
        start <= '1';
    wait for 10 ns;
        start <='0';
    wait;
end process;

end Behavioral;
