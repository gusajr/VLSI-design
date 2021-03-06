--Bibliotecas
library ieee;
use ieee.std_logic_1164.all;
--Entidad
entity checadorParidad is
port
(
	clk		: in std_logic;
	bitIn		: in std_logic; --clk,bitIn
	paridad	: out std_logic
);
end entity checadorParidad;
--Arquitectura
architecture behavior of checadorParidad is
	type states is(eI,non,par); --tipo de dato
	signal state : states := eI; --declaración de variable sobre el tipo
begin
	process(clk)
	begin 
		if rising_edge(clk) then 
			--ASM
			case state is
				when eI =>	
								paridad <= '0';
								if bitIn = '1' then
									state <= non;
								end if;
								
				when non =>
								if bitIn = '1' then
									paridad <= '1';
									state <= par;
								end if;
								
				when par =>
								if bitIn = '1' then
									paridad <= '0';
									state <= non;
								end if;
			end case;
		end if;
	end process;
end architecture behavior;
