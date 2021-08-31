library ieee;
use ieee.std_logic_1164.all;

entity comparador is
port (
		conteo:	in std_logic_vector(7 downto 0);
		--integer;
		ancho	:	in std_logic_vector(7 downto 0);
		--integer;
		pulso	:	out std_logic
		);
end entity comparador;

architecture behavior of comparador is
begin

	pulso <= '1' when conteo<ancho else '0';
	
end architecture behavior;