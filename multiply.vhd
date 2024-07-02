
-- ****************************************************************************
-- * comparator
-- ****************************************************************************

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;

entity multiply is
    generic (
        WIDTH : integer := 16
    );

    port (
        i_clk       : in std_logic;
        i_nReset    : in std_logic;
        i_num1      : in std_logic_vector(WIDTH-1 downto 0);
        i_num2      : in std_logic_vector(WIDTH-1 downto 0);
        o_multply   : out std_logic_vector(WIDTH-1 downto 0)
    );

end multiply;

architecture Behavioral of multiply is
begin
    o_multply <= std_logic_vector(resize(signed(i_num1) * signed(i_num2), o_multply'length));
end Behavioral;

