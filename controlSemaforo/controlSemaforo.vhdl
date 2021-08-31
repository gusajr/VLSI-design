library ieee;
use ieee.std_logic_1164.all;

entity controlSemaforo is
port (	f50 : in std_logic;
	ck : out std_logic;
	R : out std_logic;
	V : out std_logic;
	A : out std_logic
);
end entity controlSemaforo;

architecture behavior of controlSemaforo is
	signal clk:std_logic;
begin

--port ( f50 : in std_logic;
	 ck<=clk;
--

	u1 : entity work.freqDivider (behavior) port map (f50, clk);

--port ( clk : in std_logic;
--	 R : out std_logic:='1'; --Dura 5 ciclos
--	 A : out std_logic:='0'; --Dura 1 ciclo
--	 V : out std_logic:='0'; --Dura 4 ciclos

	u2: entity work.contador (behavior) port map (clk, R, A, V);

end architecture behavior;