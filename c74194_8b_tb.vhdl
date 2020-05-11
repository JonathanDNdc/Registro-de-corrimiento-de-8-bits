library ieee;
use ieee.std_logic_1164.all;

entity c74194_8b_tb is
end c74194_8b_tb;

architecture behav of c74194_8b_tb is
    component c74194_8b is
        port(
            CLRb     : in  std_logic;
            CLK      : in  std_logic;
            S        : in  std_logic_vector(1 downto 0);
            D        : in  std_logic_vector(7 downto 0);
            SDR, SDL : in  std_logic;
            Q        : out std_logic_vector(7 downto 0)
        );
    end component;

    signal CLRb     : std_logic;
    signal CLK      : std_logic := '0';
    signal S        : std_logic_vector(1 downto 0);
    signal D        : std_logic_vector(7 downto 0);
    signal SDR, SDL : std_logic;
    signal Q        : std_logic_vector(7 downto 0);

begin

        UUT : c74194_8b port map(CLRb, CLK, S, D, SDR, SDL, Q);

    CLK <= not CLK after 1 ns;

    process
    begin
        CLRb <= '1'; -- Esta en 0's
        S    <= "00";
        D    <= "00100100";
        SDR  <= '0';
        SDL  <= '1';
        wait for 20 ns;

        CLRb <= '0'; -- No pasa nada
        S    <= "00";
        D    <= "00100100";
        SDR  <= '0';
        SDL  <= '1';
        wait for 20 ns;

        S   <= "01"; -- Shift izq
        D    <= "00100100";
        SDR <= '0';
        SDL <= '1';
        wait for 20 ns;

        S   <= "10"; -- Shift izq
        D    <= "00100100";
        SDR <= '0';
        SDL <= '1';
        wait for 20 ns;

        S   <= "11"; -- Load
        D    <= "00100100";
        SDR <= '0';
        SDL <= '1';
        wait for 20 ns;
        
        CLRb <= '1'; -- Esta en 0's
        S   <= "11"; -- Load
        D    <= "00100100";
        SDR <= '0';
        SDL <= '1';
        wait for 20 ns;
        wait;

    end process;

end behav;