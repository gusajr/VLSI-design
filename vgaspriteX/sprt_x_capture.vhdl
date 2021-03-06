library ieee;
use ieee.std_logic_1164.all;

entity sprt_x_capture is
port(

	fclk:		in 	std_logic;
	x_left: 	in 	std_logic;
	x_right:	in 	std_logic;
	x_pos: 	out 	integer

);
end entity sprt_x_capture;

architecture behavior of sprt_x_capture is
	signal xposition: integer:=200;
begin
	x_pos<=xposition;
	
	process(fclk)
	begin
		if rising_edge(fclk) then
			if x_right='1' then
				xposition<=xposition+1;
			elsif x_left='1' then
				xposition<=xposition-1;
			end if;
		end if;
	end process;
	
end architecture behavior;