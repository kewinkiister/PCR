-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity neuronio is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    start : in STD_LOGIC;
    x_ir : in STD_LOGIC_VECTOR ( 26 downto 0 );
    x_ul : in STD_LOGIC_VECTOR ( 26 downto 0 );
    saida : out STD_LOGIC_VECTOR ( 26 downto 0 );
    ready : out STD_LOGIC
  );

end neuronio;

architecture stub of neuronio is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
