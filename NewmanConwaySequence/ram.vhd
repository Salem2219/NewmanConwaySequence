library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ram is
port(clk, wr : in std_logic;
i, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end ram;
architecture rtl of ram is
type ram_type is array (0 to 15) of
std_logic_vector(7 downto 0);
signal program: ram_type := (
    "00000000",
    "00000001",
    "00000001",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000"

);
signal iminus1, iminusf : std_logic_vector(3 downto 0);
signal f1, f2, f3, add : std_logic_vector(7 downto 0);

component adder is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component sub is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
begin
f1 <= program(conv_integer(unsigned(iminus1)));
f2 <= program(conv_integer(unsigned(iminusf)));
f3 <= program(conv_integer(unsigned(f1(3 downto 0))));
u1 : adder port map (f3, f2, add);
u2 : sub port map (i, f1(3 downto 0), iminusf);
u3 : sub port map (i, "0001", iminus1);
process(clk)
begin
if (rising_edge(clk)) then
if (wr = '1') then
program(conv_integer(unsigned(i))) <= add;
end if;
end if;
end process;
y <= program(conv_integer(unsigned(n)));
end rtl;