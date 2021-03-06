--Bibliotecas 
library ieee;
use ieee.std_logic_1164.all;

--Entidad
entity paradaEmergencia is
port(
	clk: in std_logic;
	rojo: in std_logic;
	paroTotal: out std_logic := '0'
);
end entity paradaEmergencia;

--Arquitectura
architecture behavior of paradaEmergencia is
	--Definición de estados, conjunto de valores
	type states is (e0,e1);
	--Definición de una variable sobre ese conjunto inicial
	signal state:states:=e0;
begin
	process(clk)
	begin
	
		if rising_edge(clk) then
			
			case state is
				when e0 => if rojo = '1' then
									paroTotal <= '1';
									state <= e1;
								end if;
					
				when e1 => NULL;
			end case;
			
		end if;
		
	end process;
end architecture behavior;

