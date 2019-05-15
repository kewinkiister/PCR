----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2019 08:30:43 PM
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
     Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw0 : in STD_LOGIC;
           sw15 : in STD_LOGIC;
           count0 : out STD_LOGIC_VECTOR (3 downto 0);
           count1 : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end FSM;

architecture Behavioral of FSM is

signal cnt		: std_logic :='0';
signal count    : std_logic_vector(3 downto 0) := "0000";
signal cnt0		: std_logic_vector(3 downto 0) := "0000";
signal cnt1		: std_logic_vector(3 downto 0) := "0000";
signal leds		: std_logic_vector(15 downto 0) := (others =>'0');
signal en       : std_logic :='0';

    type t_state is (Init,E0, E1, E2, E3,E4, E5, E6, E7, T0, T1);
    signal current_state, next_state: t_state := Init;

begin

armazena_t_state: process(clk, reset)
    begin
        if reset = '1' then
            current_state <= Init;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
        
    end process;
transicao: process(clk)
begin
    case current_state is 
       when E0 =>
            leds <= "1000000000000000";
            if en ='1' and sw0='0' then
                next_state <= E0;         
            elsif en ='1' and sw0='1' then
                next_state <= E1;         
            else
                next_state <= Init;
            end if;
        when E1 =>
                leds <= '0' & leds(15 downto 1);
                count <= count + '1';
            if en='1' and count<"1011" then
                next_state <= E1;
            else 
                next_state <= E2;
            end if;
        when E2 =>
            leds <= "0000000000000010";
            count <= (others =>'0');
            if sw15='0' and en='1' then
                next_state <= E3;
            elsif sw15='1' and en='1' then
                next_state <= T0;
            else 
                next_state <= Init;
            end if;
       when E3 =>
            leds <= "0000000000000001";
            if sw15='0' and en='1' then
                next_state <= T0;
            elsif sw15='1' and en='1' then
                next_state <= E4;
            else 
                next_state <= Init;
            end if;     
       when E4 =>
            leds <= leds(14 downto 0) & '0';
            count <= count + 1;
            if en='1' and count<"1011" then
                next_state <= E4;
            else 
                next_state <= E5;
            end if;  
      when E5 =>
            leds <= "0100000000000000";
            count <= (others =>'0');
            if sw0='0' and en='1' then
                next_state <= E6;
            elsif sw0='1' and en='1' then
                next_state <= T1;
            else 
                next_state <= Init;
            end if;
      when E6 =>
            leds <= "1000000000000000";
            if sw0='0' and en='1' then
                next_state <= T1;
            elsif sw0='1' and en='1' then
                next_state <= E1;
            else 
                next_state <= Init;
            end if;    
      when E7 =>
            leds <= "0000000000000001";
            if sw15='0' and en='1' then
                next_state <= E7;
            elsif sw15='1' and en='1' then
                next_state <= E4;
            else 
                next_state <= Init;
            end if;  
     when T0 =>
            cnt0 <= cnt0 + '1'; 
                next_state <= E0;
     when T1 =>
            cnt1 <= cnt1 + '1';    
                next_state <= E7;                     
     when others =>
            cnt <= '0';
            cnt0 <= "0000";
            cnt1 <= "0000";
            leds <= "0000000000000000";
            if en ='0' then
                next_state <= Init;
            else 
                next_state <= E0;
            end if;                     
    end case;

end process;
    
-- processo sequencial para o pingpong
	process(clk,reset)
	begin
		if reset = '1' then
            en <= '0';
   		elsif rising_edge(clk) then
			if cnt0 > "1001" or cnt1 > "1001" then
				en <= '0';
			 else
			 	en <= '1';
			end if;
		end if;
	end process;	
    led <=leds;
end Behavioral;
