
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;


entity signal_type is
    generic ( WIDTH : integer := 4 );
    port (
        i_clk       : in std_logic;
        i_nReset    : in std_logic;
        o_inc       : out unsigned(WIDTH-1 downto 0);
        o_dec       : out unsigned(WIDTH-1 downto 0)
    );

end signal_type;

-- ****************************************************************************
-- * ARCHITECTURE                                                             *
-- ****************************************************************************
architecture Behavioral of signal_type is
begin

    process(i_clk)
        variable  v_inc : unsigned(WIDTH-1 downto 0);
        variable  v_dec : unsigned(WIDTH-1 downto 0);
    begin
        if rising_edge(i_clk) then
            if (i_nReset = '0') then
                v_inc := to_unsigned(WIDTH/2, v_inc'length);
                v_dec := to_unsigned(WIDTH/2, v_dec'length);
            else
                v_inc   := v_inc + 1;
                v_dec   := v_dec - 1;

                o_inc  <= v_inc;
                o_dec  <= v_dec;
            end if;
        end if;
    end process;

end Behavioral;

