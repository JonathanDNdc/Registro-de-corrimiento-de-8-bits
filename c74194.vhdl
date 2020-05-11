library ieee;
use ieee.std_logic_1164.all;

entity c74194 is
    port(
        CLRb     : in  std_logic;
        CLK      : in  std_logic;
        S        : in  std_logic_vector(1 downto 0);
        D        : in  std_logic_vector(3 downto 0);
        SDR, SDL : in  std_logic;
        Q        : out std_logic_vector(3 downto 0)
    );
end c74194;

architecture behav of c74194 is
    signal R : std_logic_vector(3 downto 0);
begin

    Q <= R;

    process (CLRb, CLK)
    begin
        if (CLRb = '1') then
            R <= "0000";
        elsif rising_edge(CLK) then
            case S is
                when "11"   => R <= D;
                when "10"   => R <= SDR&R(3 downto 1);
                when "01"   => R <= R(2 downto 0)&SDL;
                when others => null;
            end case;
        end if;
    end process;

end behav;