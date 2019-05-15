----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2019 11:41:37
-- Design Name: 
-- Module Name: ping_pong_seq - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Deion: 
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

entity ping_pong_leds is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw0 : in STD_LOGIC;
           sw15 : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end ping_pong_leds;

architecture Behavioral of ping_pong_leds is

signal s_clk_10Hz : std_logic := '0';
signal s_clk_40Hz : std_logic := '0';
signal s_lr : std_logic := '0';
signal s_player : std_logic := '0';
signal s_enable : std_logic := '0';
signal s_cnt0 : std_logic_vector (3 downto 0) :=(others => '0');
signal s_cnt1 : std_logic_vector (3 downto 0) :=(others => '0');
signal s_an : std_logic_vector (3 downto 0) :=(others => '0');
signal s_bin : std_logic_vector (3 downto 0) :=(others => '0');
signal s_led : std_logic_vector (15 downto 0) :=(others => '0');



component clk_10Hz is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_10Hz : out STD_LOGIC);
end component;

component clk_40Hz is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_40Hz : out STD_LOGIC);
end component;

component anodo is
    Port ( clk_40Hz : in STD_LOGIC;
           reset : in STD_LOGIC;
           cnt0 : in STD_LOGIC_VECTOR (3 downto 0);
           cnt1 : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           s_bin : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component seg7 is
    Port ( s_bin : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component controlador is
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
end component;

component deslocamento is
    Port ( clk_10Hz : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           lr : in STD_LOGIC;
           player : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (15 downto 0));
end component;

begin
u1: clk_10Hz port map(
           clk => clk,
           reset => reset,
           clk_10Hz => s_clk_10Hz);

u2: clk_40Hz port map(
           clk => clk,
           reset => reset,
           clk_40Hz => s_clk_40Hz);

u3: anodo port map(
           clk_40Hz => s_clk_40Hz,
           reset => reset,
           cnt0 => s_cnt0,
           cnt1 => s_cnt1,
           an => s_an,
           s_bin => s_bin);
           
u4: seg7 port map(
           s_bin => s_bin,
           seg => seg);
      
u5: deslocamento port map(
           clk_10Hz => s_clk_10Hz,
           reset => reset,
           enable => s_enable,
           lr => s_lr,
           player => s_player,
           led => led);


u6: controlador port map (
           clk => clk,
           reset => reset,
           sw0 => sw0,
           sw15 => sw15,
           led => s_led,
           cnt0 => s_cnt0,
           cnt1 => s_cnt1,
           lr => s_lr,
           enable => s_enable,
           player => s_player);
           
end Behavioral;









