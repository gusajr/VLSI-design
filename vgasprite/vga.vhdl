library ieee;
use ieee.std_logic_1164.all;

entity vga is
port(
	f50   : 	in std_logic;
	h_sync: 	out std_logic;
	v_sync: 	out std_logic;
	red:		out std_logic_vector(3 downto 0);
	green:	out std_logic_vector(3 downto 0);
	blue:		out std_logic_vector(3 downto 0)
);
end vga;

architecture behavior of vga is
	signal f25:		std_logic;
	signal h_count:integer;
	signal cy:		std_logic;
	
	signal v_count:integer;
	signal dispEna:std_logic;
	
begin

--port (f50: in std_logic;
		--f25: out std_logic;
u1: entity work.freqDivider(behavior) port map (f50, f25);

-- port	( 	f25: in std_logic;
--			h_count: out integer;
--			h_sync: out std_logic:='1';
--			cy: out std_logic:='0'

u2: entity work.hcounter(behavior) port map (f25,h_count,h_sync,cy);	

--port	(	cy: 		in std_logic;
--			v_count: out integer:=0;
--			v_sync: 	out std_logic:='1'
--		);

u3: entity work.vcounter(behavior) port map (cy,v_count,v_sync);

dispEna <= '1' when(h_count>=0 and h_count<640 and
					v_count>=0 and v_count<480) else '0';

--row:		in		integer; --row pixel coordinate
--	column:	in		integer; --column pixel coordinate
--	red:		out	std_logic_vector(3 downto 0) := "0000"; --red magnitude output to DAC
--	green:	out	std_logic_vector(3 downto 0) := "0000"; --green magnitude output to DAC
--	blue:		out	std_logic_vector(3 downto 0) := "0000" --blue magnitude output to DAC

u4: entity work.image_generator(behavior) port map (dispEna, v_count, h_count, red, green, blue);

end architecture behavior;