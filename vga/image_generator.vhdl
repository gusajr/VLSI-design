library ieee;
use ieee.std_logic_1164.all;

entity image_generator is
port(
	dispEna: in		std_logic; --seguro para evitar señales fuera de zona
	row:		in		integer; --row pixel coordinate
	col:	in		integer; --column pixel coordinate
	red:		out	std_logic_vector(3 downto 0) := "0000"; --red magnitude output to DAC
	green:	out	std_logic_vector(3 downto 0) := "0000"; --green magnitude output to DAC
	blue:		out	std_logic_vector(3 downto 0) := "0000" --blue magnitude output to DAC
);

end image_generator;

architecture behavior of image_generator is
begin
	process(dispEna,row,col)
	begin
		if dispEna='1' then
			if(row>200 and row<250 and col>200 and col<250) then
				red 	<= "0000";
				green <= "0000";
				blue 	<= "1111";
			elsif(row>200 and row<250 and col>300 and col<350) then
				red 	<= "1111";
				green <= "0000";
				blue 	<= "0000";
			else
				red 	<= "0000";
				green <= "0000";
				blue 	<= "0000";
			end if;
		else
			red 	<= "0000";
			green <= "0000";
			blue 	<= "0000";
		end if;
	end process;
end architecture behavior;