
-- ****************************************************************************
-- * comparator
-- ****************************************************************************

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;

entity compare is
    generic (
        WIDTH : integer := 8
    );

    port (
        i_clk       : in std_logic;
        i_nReset    : in std_logic;
        i_num1      : in std_logic_vector(WIDTH-1 downto 0);
        i_num2      : in std_logic_vector(WIDTH-1 downto 0);
        o_out       : out std_logic
    );

end compare;

architecture Behavioral of compare is
begin
    o_out <= '1' when signed(i_num1) > signed(i_num2) else '0';
end Behavioral;

