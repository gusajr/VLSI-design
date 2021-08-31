--Integrantes:
--Cabrera Gaytan Jazmín Andrea
--Hernández Torres Agustín de Jesús
--Jiménez Ruiz Gustavo Alfredo
--Manzo Ruíz Yocelyne
--Zarco Muñoz Gabriel

library ieee;
use ieee.std_logic_1164.all;
entity freqDivider is
port	( 	f50: in std_logic;
			f25: out std_logic
		);
end entity freqDivider;
architecture behavior of freqDivider is
	signal clk:std_logic:='0';
begin
	f25 <=clk;
	process(f50)
	begin
		if rising_edge(f50) then
			clk<=not clk;
		end if;
	end process;
end architecture behavior;
