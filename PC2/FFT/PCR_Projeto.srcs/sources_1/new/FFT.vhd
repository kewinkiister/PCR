----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2019 10:20:17 PM
-- Design Name: 
-- Module Name: FFT - Behavioral
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

entity FFT is
    Port ( CLK : in STD_LOGIC;
           Start : in STD_LOGIC;
           Xout : out STD_LOGIC_VECTOR (0 to 31);
           Ready: out STD_LOGIC);
end FFT;

architecture Behavioral of FFT is


signal tdata                     : std_logic_vector(7 downto 0);
signal tvalid                    : std_logic;
signal tready                    : std_logic;
signal data_tdata                : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal data_tvalid               : STD_LOGIC;
signal data_tready               : STD_LOGIC;
signal data_tlast                : STD_LOGIC;
signal data_tuser                : STD_LOGIC_VECTOR (7 DOWNTO 0);
signal mstatus_tdata             : STD_LOGIC_VECTOR (7 DOWNTO 0);
signal mstatus_tvalid            : STD_LOGIC;
signal frame_started             : STD_LOGIC;
signal tlast_unexpected          : STD_LOGIC;
signal tlast_missing             : STD_LOGIC;
signal status_channel_halt       : STD_LOGIC;
signal data_in_channel_halt      : STD_LOGIC;
signal data_out_channel_halt     : STD_LOGIC;




component xfft_0 IS
  PORT (
    aclk : IN STD_LOGIC;                                    --CLK de entrada da FFT
    s_axis_config_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);  --Dado de saida da FFT
    s_axis_config_tvalid : IN STD_LOGIC;                    --Start da FFT
    s_axis_config_tready : OUT STD_LOGIC;                   --Ready da FFT
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);   --Carrega os dados de amostra não processados
    s_axis_data_tvalid : IN STD_LOGIC;                      --Usado para sinalizar que é capaz de fornecer dados.
    s_axis_data_tready : OUT STD_LOGIC;                     --Usado para sinalizar que está pronto para aceitar dados.
    s_axis_data_tlast : IN STD_LOGIC;                       --Usado para sinalizar a ultima amostra setada.
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);  --Transporta os dados da amostra processada.
    m_axis_data_tuser : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);   --Carrega informações adicionais por amostra como XK_INDEX, OVFLO.
    m_axis_data_tvalid : OUT STD_LOGIC;                     --Usado internamente para sinalizar que é capaz de fornecer dados de amostra.
    m_axis_data_tready : IN STD_LOGIC;                      --READY para o canal de saída de dados. Setado pelo escravo externo para sinalizar que está pronto para aceitar dados.
    m_axis_data_tlast : OUT STD_LOGIC;                      --TLAST para o canal de entrada de dados. Setado pelo mestre externo na última amostra do quadro, Armação.
    m_axis_status_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --TDATA para o canal de status. Carrega os dados de status: BLK_EXP ou OVFLO.
    m_axis_status_tvalid : OUT STD_LOGIC;                   --Setado pelo núcleo para sinalizar que é capaz de fornecer dados de status.
    m_axis_status_tready : IN STD_LOGIC;                    --READY para o canal de status. Setado pelo escravo externo para sinalizar que está pronto para aceitar dados.
    event_frame_started : OUT STD_LOGIC;                    --Setado quando o núcleo começa a processar um novo quadro. 
    event_tlast_unexpected : OUT STD_LOGIC;                 --Setado quando o núcleo vê s_axis_data_tlast High em uma amostra de dados que não é a última em um quadro.
    event_tlast_missing : OUT STD_LOGIC;                    --Setado quando s_axis_data_tlast é baixo na última amostra de dados de um quadro.
    event_status_channel_halt : OUT STD_LOGIC;              --Setado quando o núcleo tenta gravar dados no canal de Status e é incapaz de fazê-lo.
    event_data_in_channel_halt : OUT STD_LOGIC;             --Setado quando o núcleo solicita dados do canal Data Input e nenhum está disponível.
    event_data_out_channel_halt : OUT STD_LOGIC             --Setado quando o núcleo tenta gravar dados no canal de saída de dados e não consegue fazê-lo.
  );
END  component;

begin

U1 : xfft_0
  PORT MAP (
    aclk => CLK,
    s_axis_config_tdata => "00001010",
    s_axis_config_tvalid => Start,
    s_axis_config_tready => Ready,
    s_axis_data_tdata => data_tdata,
    s_axis_data_tvalid => data_tvalid,
    s_axis_data_tready => data_tready,
    s_axis_data_tlast => data_tlast,
    m_axis_data_tdata => Xout,
    m_axis_data_tuser => data_tuser,
    m_axis_data_tvalid => data_tvalid,
    m_axis_data_tready => '0',
    m_axis_data_tlast => data_tlast,
    m_axis_status_tdata => mstatus_tdata,
    m_axis_status_tvalid => mstatus_tvalid,
    m_axis_status_tready => '0',
    event_frame_started => frame_started,
    event_tlast_unexpected => tlast_unexpected,
    event_tlast_missing => tlast_missing,
    event_status_channel_halt => status_channel_halt,
    event_data_in_channel_halt => data_in_channel_halt,
    event_data_out_channel_halt => data_out_channel_halt
  );


end Behavioral;
