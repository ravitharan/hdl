
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;


entity tb_signals is
end tb_signals;

-- ****************************************************************************
-- * ARCHITECTURE                                                             *
-- ****************************************************************************
architecture Behavioral of tb_signals is

    constant WIDTH  : integer := 4;
    signal clk      : std_logic := '0';
    signal nReset   : std_logic;
    signal inc      : unsigned(WIDTH-1 downto 0);
    signal dec      : unsigned(WIDTH-1 downto 0);

begin

    clk <= not clk after 5 ns;

    dut : entity work.signal_type
    port map ( 
        i_clk       => clk,
        i_nReset    => nReset,
        o_inc       => inc,
        o_dec       => dec);

    process is
    begin
        nReset  <= '0';
        wait for 100 ns;
        nReset  <= '1';
        wait;
    end process;

end Behavioral;

