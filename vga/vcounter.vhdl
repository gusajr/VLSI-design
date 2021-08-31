--v_counter
--Integrantes:
--Cabrera Gaytan Jazmín Andrea
--Hernández Torres Agustín de Jesús
--Jiménez Ruiz Gustavo Alfredo
--Manzo Ruiz Yocelyne
--Zarco Muñoz Gabriel

library ieee;
use ieee.std_logic_1164.all;
entity vcounter is
port	(	cy: 		in std_logic;
			v_count: out integer:=0;
			v_sync: 	out std_logic:='1'
		);
end entity vcounter;
architecture behavior of vcounter is
	signal vcnt: integer:=0;
begin
	v_count<= vcnt;
	v_sync<='0' when (vcnt>=490 and vcnt<=491) else '1';
	process(cy)
	begin
		if rising_edge(cy) then
			if vcnt=524 then
				vcnt<=0;
			else
				vcnt<=vcnt+1;
			end if;
		end if;
	end process;
end architecture behavior;
