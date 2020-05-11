library ieee;
use ieee.std_logic_1164.all;

entity c74194_8b is 
    port(
        CLRb     : in  std_logic;
        CLK      : in  std_logic;
        S        : in  std_logic_vector(1 downto 0);
        D        : in  std_logic_vector(7 downto 0);
        SDR, SDL : in  std_logic;
        Q        : out std_logic_vector(7 downto 0)
    );
end c74194_8b;

architecture behav of c74194_8b is
    component c74194 is
        port(
            CLRb     : in  std_logic;
            CLK      : in  std_logic;
            S        : in  std_logic_vector(1 downto 0);
            D        : in  std_logic_vector(3 downto 0);
            SDR, SDL : in  std_logic;
            Q        : out std_logic_vector(3 downto 0)
        );
    end component;

    signal Qi : std_logic_vector(7 downto 0);
begin
        c1 : c74194 port map(CLRb, CLK, S, D(7 downto 4), SDR, Qi(3), Qi(7 downto 4));
        c2 : c74194 port map(CLRb, CLK, S, D(3 downto 0), Qi(4), SDL, Qi(3 downto 0));
    Q <= Qi;

end behav;