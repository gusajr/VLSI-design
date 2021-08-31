--Integrantes:
--Cabrera Gaytan Jazmín Andrea
--Hernández Torres Agustín de Jesús
--Jiménez Ruiz Gustavo Alfredo
--Manzo Ruiz Yocelyne
--Zarco Muñoz Gabriel

library ieee;
use ieee.std_logic_1164.all;

entity vga is
port(
		f50			: in std_logic;
		h_count		: out integer;
		h_sync		: out std_logic;
		v_count		: out integer;
		v_sync		: out std_logic
	 );
end entity vga;


architecture behavior of vga is
	--Cableados y bufferes internos
	signal f25, cy		: std_logic;
	
begin

-- port(	f50	: in 		std_logic;
--			f25	: out 	std_logic
-- );
u1: entity work.freqDivider (behavior) port map (f50,f25);

-- port	( 	f25: in std_logic;
--			h_count: out integer;
--			h_sync: out std_logic:='1';
--			cy: out std_logic:='0'
--		);
u2: entity work.hcounter(behavior) port map (f25,h_count,h_sync,cy);

--port	(	cy: 		in std_logic;
--			v_count: out integer:=0;
--			v_sync: 	out std_logic:='1'
--		);

u3: entity work.vcounter(behavior) port map (cy,v_count,v_sync);

end architecture behavior;
