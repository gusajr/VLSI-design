library ieee;
use ieee.std_logic_1164.all;

entity newFreq is
port	( 	f50	: in 	std_logic;	--Frecuencia de entrada
			f25	: out std_logic	--Frecuencia de salida reducida a la mitad
		);
end entity newFreq;

architecture behavior of newFreq is

	signal clk:std_logic:='0';
	
begin

	f25 <= clk;
	process(f50)
	begin
	
		if rising_edge(f50) then
			clk <= not clk;
		end if;
		
	end process;
end architecture behavior;