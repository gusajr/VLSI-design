library ieee;
use ieee.std_logic_1164.all;

entity slowCounter is
port(
	f50	: in std_logic;
	Q		: out std_logic_vector (3 downto 0)
);
end entity slowCounter;

architecture behavior of slowCounter is
	--cableados y buferes internos
	signal clk: std_logic;
	
begin

--port(
--	f50: in std_logic;
--	clk: out std_logic --inout
--);

u1: entity work.freqdivider(behavior) port map (f50,clk);

--port(
--	clk: in std_logic;
--	Q: out std_logic_vector(3 downto 0)
--);

u2: entity work.contador(behavior) port map (clk,Q);


end architecture behavior;