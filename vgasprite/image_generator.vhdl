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

	--memory for sprite
	type	matrix is array(0 to 767) of std_logic_vector(7 downto 0);
	signal sprite:matrix;
	attribute ram_init_file:string;
	attribute ram_init_file of sprite:signal is "mario_16_rgb.mif";

	--variables to acces the memory sprite
	signal addr:integer;
	signal dataR:std_logic_vector(3 downto 0); --el DAC es de 4 bits del VGA de la FPGA
	signal dataG:std_logic_vector(3 downto 0);
	signal dataB:std_logic_vector(3 downto 0);
	
begin
	process(dispEna,row,col)
	begin
		if dispEna='1' then
			if(row>200 and row<216 and col>200 and col<216) then
					
				--obtener un pixel
				--convertir (row,col) en un indice de arreglo
				
				addr <= ((row-200)*48) + (((col-200)*3));
				dataR <= sprite(addr)(7 downto 4);
				addr <= ((row-200)*48) + (((col-200)*3)+1);
				dataG <= sprite(addr)(7 downto 4);
				addr <= ((row-200)*48) + (((col-200)*3)+2);
				dataB <= sprite(addr)(7 downto 4);
				
				--enviar señales
				red 	<= dataR;
				green <= dataR;
				blue 	<= dataR;
			else
				red 	<= "0000"; --es el fondo
				green <= "0000";
				blue 	<= "0000";
			end if;
		else
			red 	<= "0000"; --es el fondo
			green <= "0000";
			blue 	<= "0000";
		end if;
	end process;
end architecture behavior;