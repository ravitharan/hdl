
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;


entity test_bench is
end test_bench;

-- ****************************************************************************
-- * ARCHITECTURE                                                             *
-- ****************************************************************************
architecture Behavioral of test_bench is
    constant WIDTH  : integer := 5;
    constant DATA_WIDTH  : integer := 16;

    signal clk      : std_logic := '0';
    signal nReset   : std_logic := '0';
    signal key      : std_logic_vector(WIDTH-1 downto 0);
    signal value    : std_logic_vector(DATA_WIDTH-1 downto 0);
begin

    dut_cmp : entity work.lookup
    generic map ( 
                    WIDTH => WIDTH
                )

    port map ( 
                 i_key      => key,
                 o_value    => value
             );

    clk <= not clk after 5 ns;
    nReset  <= '1' after 100ns;

    process(clk)
        variable local: unsigned(WIDTH-1 downto 0);
    begin
        if rising_edge(clk) then
            if (nReset = '0') then
                local := (others => '0');
            else
                local := local + 1;
            end if;
            key <= std_logic_vector(local);
        end if;
    end process;


end Behavioral;

