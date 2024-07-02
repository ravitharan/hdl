



-- ****************************************************************************
-- * increment and decrement                                                             *
-- ****************************************************************************

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;

entity incdec is
    generic ( WIDTH : integer := 4 );
    port (
        i_clk       : in std_logic;
        i_nReset    : in std_logic;
        o_inc       : out std_logic_vector(WIDTH-1 downto 0);
        o_dec       : out std_logic_vector(WIDTH-1 downto 0)
    );

end incdec;

architecture Behavioral of incdec is
begin

    process(i_clk)
        variable  inc : unsigned(WIDTH-1 downto 0);
        variable  dec : unsigned(WIDTH-1 downto 0);
    begin
        if rising_edge(i_clk) then
            if (i_nReset = '0') then
                inc := to_unsigned(WIDTH/2, inc'length);
                dec := to_unsigned(WIDTH/2, dec'length);
            else
                inc   := inc + 1;
                dec   := dec - 1;

                o_inc  <= std_logic_vector(inc);
                o_dec  <= std_logic_vector(dec);
            end if;
        end if;
    end process;

end Behavioral;

