
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
    signal nReset   : std_logic := '0';
    signal inc      : std_logic_vector(WIDTH-1 downto 0);
    signal dec      : std_logic_vector(WIDTH-1 downto 0);

begin

    dut_incdec : entity work.incdec
    generic map ( 
                    WIDTH => WIDTH
                )

    port map ( 
                 i_clk       => clk,
                 i_nReset    => nReset,
                 o_inc       => inc,
                 o_dec       => dec
             );

    clk <= not clk after 5 ns;
    nReset  <= '1' after 100ns;

end Behavioral;

