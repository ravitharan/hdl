
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;


entity test_bench is
end test_bench;

-- ****************************************************************************
-- * ARCHITECTURE                                                             *
-- ****************************************************************************
architecture Behavioral of test_bench is
    constant WIDTH  : integer := 16;
    signal clk      : std_logic := '0';
    signal nReset   : std_logic := '0';
    signal num1     : std_logic_vector(WIDTH-1 downto 0);
    signal num2     : std_logic_vector(WIDTH-1 downto 0);
    signal multiply : std_logic_vector(WIDTH-1 downto 0);
begin

    dut_cmp : entity work.multiply
    generic map ( 
                    WIDTH => WIDTH
                )

    port map ( 
                 i_clk       => clk,
                 i_nReset    => nReset,
                 i_num1      => num1,
                 i_num2      => num2,
                 o_multply   => multiply
             );

    clk <= not clk after 5 ns;
    nReset  <= '1' after 100ns;

    process (clk)
        variable v1 : signed(WIDTH-1 downto 0);
        variable v2 : signed(WIDTH-1 downto 0);
    begin
        if rising_edge(clk) then
            if nReset = '0' then
                v1 := x"0025";
                v2 := x"0000";
            else
                v2 := v2 + 1;
            end if;
        end if;
        num1 <= std_logic_vector(v1);
        num2 <= std_logic_vector(v2);
    end process;


end Behavioral;

