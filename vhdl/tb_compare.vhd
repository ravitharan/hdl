
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;


entity test_bench is
end test_bench;

-- ****************************************************************************
-- * ARCHITECTURE                                                             *
-- ****************************************************************************
architecture Behavioral of test_bench is
    constant WIDTH  : integer := 8;
    signal clk      : std_logic := '0';
    signal nReset   : std_logic := '0';
    signal num1     : std_logic_vector(WIDTH-1 downto 0);
    signal num2     : std_logic_vector(WIDTH-1 downto 0);
    signal cmp_out  : std_logic;
begin

    dut_cmp : entity work.compare
    generic map ( 
                    WIDTH => WIDTH
                )

    port map ( 
                 i_clk       => clk,
                 i_nReset    => nReset,
                 i_num1      => num1,
                 i_num2      => num2,
                 o_out       => cmp_out
             );

    clk <= not clk after 5 ns;
    nReset  <= '1' after 100ns;
    num1    <= x"20";

    process(clk)
        variable local: signed(WIDTH-1 downto 0);
    begin
        if rising_edge(clk) then
            if (nReset = '0') then
                local := x"00";
            else
                local := local + 1;
            end if;
            num2 <= std_logic_vector(local);
        end if;
    end process;


end Behavioral;

