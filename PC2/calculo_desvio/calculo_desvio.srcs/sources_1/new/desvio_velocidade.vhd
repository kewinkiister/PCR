----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2019 20:39:55
-- Design Name: 
-- Module Name: desvio_velocidade - Behavioral
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
use work.fpupack.all;
use work.entities.all;

entity desvio_velocidade is
   generic(const : in std_logic_vector(26 downto 0):= "001111100010011111000000101");
   Port (clk   : in std_logic;
      start : in std_logic;
      ready : out std_logic;
      reset : in std_logic;
      freq: in std_logic_vector(26 downto 0);
      vel: out std_logic_vector(26 downto 0));
end desvio_velocidade;

architecture Behavioral of desvio_velocidade is
   
   component multiplierfsm_v2 is
      port (reset 	 :  in std_logic; 
         clk 	 :  in std_logic;          
         op_a	 	 :  in std_logic_vector(FP_WIDTH-1 downto 0);
         op_b	 	 :  in std_logic_vector(FP_WIDTH-1 downto 0);
         start_i	 :  in std_logic;
         mul_out  : out std_logic_vector(FP_WIDTH-1 downto 0);
         ready_mul: out std_logic);
   end component;		
	 
begin

   vel_calc: multiplierfsm_v2 
      port map(reset  => reset,
         clk	    => clk,       
         op_a	    => const,
         op_b	    => freq,	 
         start_i   => start,
         mul_out   => vel,
         ready_mul => ready);

end Behavioral;
