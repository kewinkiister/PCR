----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2019 09:34:38 AM
-- Design Name: 
-- Module Name: Top - Behavioral
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

entity Top is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           x_ir  : in STD_LOGIC_VECTOR (FP_WIDTH-1 downto 0);
           x_ul  : in STD_LOGIC_VECTOR (FP_WIDTH-1 downto 0);
           saida : out STD_LOGIC_VECTOR (FP_WIDTH-1 downto 0);
           ready : out STD_LOGIC);
end Top;

architecture Behavioral of Top is

signal addra : std_logic_vector (6 downto 0);
signal sx_ir  : STD_LOGIC_VECTOR (FP_WIDTH-1 downto 0);
signal sx_ul  : STD_LOGIC_VECTOR (FP_WIDTH-1 downto 0);


component neuronio is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           x_ir  : in STD_LOGIC_VECTOR (FP_WIDTH-1 downto 0);
           x_ul  : in STD_LOGIC_VECTOR (FP_WIDTH-1 downto 0);
           saida : out STD_LOGIC_VECTOR (FP_WIDTH-1 downto 0);
           ready : out STD_LOGIC);
end component;

COMPONENT ROMmenXir
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(26 DOWNTO 0));
END COMPONENT;

COMPONENT ROMmenXul
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(26 DOWNTO 0)
  );END COMPONENT;

component addra1 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           addra : out STD_LOGIC_VECTOR (6 downto 0));
end component;

begin

u1: ROMmenXir port map(
    clka => clk,
    ena => start,
    addra => addra,
    douta => sx_ir);

u2: ROMmenXul PORT MAP (
    clka => clk,
    ena => start,
    addra => addra,
    douta => sx_ul);
  
 u3: neuronio Port map (
   clk => clk,
   reset => reset, 
   start => start,
   x_ir  => sx_ir,
   x_ul  => sx_ul,
   saida => saida,
   ready => ready);
   
u4: addra1 port map(
   clk => clk,
   reset => reset,
   addra =>addra);
 
end Behavioral;
