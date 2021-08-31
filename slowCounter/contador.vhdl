--BIBLIOTECAS
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; --permite incrementar una variable

--PUERTO
entity contador is
port(
	clk: in std_logic;
	Q: out std_logic_vector(3 downto 0)
);
end entity contador;

--CIRCUITO INTERIOR: ARQUITECTURA
architecture behavior of contador is
	signal R: std_logic_vector(3 downto 0) := "0000";
begin
	Q <= R;
	--CONTENIDO DE LA LÓGICA
	process(clk)
	begin
		if rising_edge(clk) then
		--if clk'event and clk='1' then
			if R = "1111" then
				R <= "0000";
			else
				R <= R + 1;
			end if;
		end if;
	end process;
end architecture behavior;

--ASIGNACION DE VALORES INICIALES NO DEFINIDAS EN ASM