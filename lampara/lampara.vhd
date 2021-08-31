--Cabeceras
library ieee;
use ieee.std_logic_1164.all;

--Crear puerto, es un segmento
entity lampara is
port(
	clk: in std_logic;
	boton: in std_logic;
	foco: out std_logic
);
end entity lampara;

--La lógica interna
architecture behavior of lampara is
	signal luz: std_logic := '0'; --apagado
begin
	foco <= luz;
	
	process(clk)
	begin
		if rising_edge(clk) then --reloj pasa de cero a uno
			if boton = '1' then
				luz <= not luz;
			end if;
		end if;
	end process;
end architecture behavior;