
-- ****************************************************************************
-- * comparator
-- ****************************************************************************

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;

entity lookup is
    generic (
        WIDTH : integer := 5;
        DATA_WIDTH : integer := 16
    );

    port (
        i_key   : in std_logic_vector(WIDTH-1 downto 0);
        o_value : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );

end lookup;

architecture Behavioral of lookup is
    type   constantArrayType is array (2**WIDTH-1 downto 0) of integer;
    constant VALUES : constantArrayType := (
        0,
        6596,
        12922,
        18719,
        23750,
        27808,
        30728,
        32390,
        32726,
        31722,
        29419,
        25912,
        21344,
        15902,
        9810,
        3315,
        -3315,
        -9810,
        -15902,
        -21344,
        -25912,
        -29419,
        -31722,
        -32726,
        -32390,
        -30728,
        -27808,
        -23750,
        -18719,
        -12922,
        -6596,
        0
    );
begin
    o_value <= std_logic_vector(to_signed(VALUES(to_integer(unsigned(i_key))), o_value'length));
end Behavioral;

