library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, sel, ld : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x : out std_logic;
    y : out std_logic_vector(7 downto 0));
end dp;

architecture rtl of dp is
component compgr is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component plus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component mux4 is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;
component ram is
port(clk, wr : in std_logic;
i, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end component;
signal iplus1, i_in, i : std_logic_vector(3 downto 0);
begin
    i_op : plus1 port map (i, iplus1);
    i_mux : mux4 port map (sel, "0011", iplus1, i_in);
    i_reg : reg4 port map (clk, rst, ld, i_in, i);
    count_ram : ram port map (clk, sel, i, n, y);
    in_compgr : compgr port map (i, n, x);
end rtl;