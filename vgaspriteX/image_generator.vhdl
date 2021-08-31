library ieee;
use ieee.std_logic_1164.all;

entity image_generator is
port(
	dispEna: in		std_logic; --seguro para evitar señales fuera de zona
	row:		in		integer; --row pixel coordinate
	col:	in		integer; --column pixel coordinate
	
	x_pos:	in		integer;
	
	red:		out	std_logic_vector(3 downto 0) := "0000"; --red magnitude output to DAC
	green:	out	std_logic_vector(3 downto 0) := "0000"; --green magnitude output to DAC
	blue:		out	std_logic_vector(3 downto 0) := "0000" --blue magnitude output to DAC
);

end image_generator;

architecture behavior of image_generator is

	--memory for sprite
	type	matrix is array(0 to 255) of std_logic_vector(7 downto 0);
	signal sprite:matrix;
	attribute ram_init_file:string;
	attribute ram_init_file of sprite:signal is "pacman.mif";

	--variables to acces the memory sprite
	signal addr:integer;
	signal data:std_logic_vector(3 downto 0); --el DAC es de 4 bits del VGA de la FPGA

begin
	process(dispEna,row,col)
	begin
		if dispEna='1' then
			if(row>200 and row<216 and col>x_pos and col<(x_pos+16)) then
			
				--convertir (row,col) en un indice de arreglo
				addr <= ((row-200)*16) + (col-x_pos);
				
				--obtener un pixel
				data <= sprite(addr)(7 downto 4);
				
				--enviar señales
				red 	<= data;
				green <= data;
				blue 	<= data;
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