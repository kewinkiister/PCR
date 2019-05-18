----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2019 22:57:55
-- Design Name: 
-- Module Name: tb_desv - Behavioral
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
use std.textio.all;
use IEEE.std_logic_textio.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.fpupack.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_desv is
--  Port ( );
end tb_desv;

architecture Behavioral of tb_desv is

signal first_start : std_logic := '0';
signal next_start  : std_logic := '0';
signal ready_sig   : std_logic := '0';
signal reset_sig   : std_logic := '0';
signal clk_sig     : std_logic := '0';
signal start_sig   : std_logic := '0';
signal freq_sig    : std_logic_vector(26 downto 0);
signal vel_sig    : std_logic_vector(26 downto 0);

component desvio_velocidade is
   
   Port (clk   : in std_logic;
      start : in std_logic;
      ready : out std_logic;
      reset : in std_logic;
      freq: in std_logic_vector(26 downto 0);
      vel: out std_logic_vector(26 downto 0));
end component; 
signal ROMaddress : std_logic_vector(7 downto 0) := (others=>'0');
signal WOMenable : std_logic := '0';     
begin
    -- reset generator
reset_sig <= '0', '1' after 15 ns, '0' after 25 ns;

-- clock generator
clk_sig  <= not clk_sig  after 5 ns; 

-- cria o start 
first_start <= '0', '1' after 55 ns, '0' after 65 ns; 

UUT: desvio_velocidade 
   Port map (clk  => clk_sig,  
      start => start_sig,
      ready => ready_sig,
      reset => reset_sig,
      freq  => freq_sig,
      vel   => vel_sig);


rom_x1: process
    file infile	: text is in "X_arq_bin_.txt"; -- input file declaration
    variable inline : line; -- line number declaration
    variable dataf  : std_logic_vector(FP_WIDTH-1 downto 0); 
    begin
        while (not endfile(infile)) loop
            wait until rising_edge(clk_sig);
                if first_start='1' or ready_sig='1' then
                    readline(infile, inline);
                    read(inline,dataf);
                    freq_sig <= dataf;
                    start_sig <= '1';
                else
                    start_sig <= '0';
                end if;
                
        end loop;
        assert not endfile(infile) report "FIM DA LEITURA" severity warning;
        wait;        
    end process;
    
    WOMenable <= ready_sig;
        
        wom_n1 : process(clk_sig) 
        variable out_line : line;
        file out_file     : text is out "vel_bin.txt";
        begin
            -- write line to file every clock
            if (rising_edge(clk_sig)) then
                if WOMenable = '1' then
                    write (out_line, vel_sig);
                    writeline (out_file, out_line);
                end if; 
            end if;  
        end process ;
    
end Behavioral;
