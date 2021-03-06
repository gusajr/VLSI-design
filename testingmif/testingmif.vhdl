--declaración de bibliotecas
library ieee;
use ieee.std_logic_1164.all;

--entidad
entity testingmif is
port(
	f50 		:	in 	std_logic;
	data	:	out 	std_logic_vector(3 downto 0)
	);
end entity testingmif;

--arquitectura
architecture behavior of testingmif is
	
	signal clk: std_logic:='0';
	signal cnt: integer:=0;
	
	type matrix is array (0 to 7) of std_logic_vector(7 downto 0);
	signal mem: matrix;
	attribute ram_init_file: string; --esta línea no cambia nunca
	attribute ram_init_file of mem: signal is "inicio.mif";
	signal ndx: integer:=0; --variable para recorrer el arreglo
	
	
begin

	--reloj
	process(f50)
	begin
		if rising_edge(f50) then
			
			if cnt=25000000 then
				clk<=not clk;
				cnt<=0;
			else
				cnt<=cnt+1;
			end if;
			
		end if;
			
	end process;
	
	--recorre arreglo
	process(clk)
	begin
		if rising_edge(clk) then
			--contador
			if ndx=7 then
				ndx<=0;
			else
				ndx<=ndx+1;
			end if;
			
			--acceso al arreglo
			data<=mem(ndx)(3 downto 0);
			
		end if;
	end process;
	
end architecture behavior;