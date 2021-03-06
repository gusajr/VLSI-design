--h_counter
--Integrantes:
--Cabrera Gaytan Jazmín Andrea
--Hernández Torres Agustín de Jesús
--Jiménez Ruiz Gustavo Alfredo
--Manzo Ruiz Yocelyne
--Zarco Muñoz Gabriel

library ieee;
use ieee.std_logic_1164.all;
entity hcounter is
port	( 	f25: in std_logic;
			h_count: out integer;
			h_sync: out std_logic:='1';
			cy: out std_logic:='0'
		);
end entity hcounter;
architecture behavior of hcounter is
	signal hcnt: integer:=0;
begin
	h_count <= hcnt;
	h_sync<='0' when (hcnt >=656 and hcnt<=751) else '1';
process(f25)
begin
	if rising_edge(f25) then
		if hcnt=799 then
			hcnt<=0;
			cy<='1';
		else
			hcnt<=hcnt+1;
			cy<='0';
		end if;
	end if;
end process;
end architecture behavior;
