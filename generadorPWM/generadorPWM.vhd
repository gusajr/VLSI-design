library ieee;
use ieee.std_logic_1164.all;

entity generadorPWM is
port(
		f50	: in std_logic;
		ancho : in std_logic_vector(7 downto 0);
		pulso	: out std_logic
	 );
end entity generadorPWM;


architecture behavior of generadorPWM is
	--Cableados y bufferes internos
	signal clk: std_logic;
	signal conteo: std_logic_vector(7 downto 0);
	
begin

--port(	f50	: in 		std_logic;
--clk	: out 	std_logic

u1: entity work.freqdivider(behavior) port map (f50,clk);

--port( clk: in std_logic;
--		conteo: out std_logic_vector(7 downto 0)
--	 );

u2: entity work.contador(behavior) port map (clk,conteo);

--port (
--		conteo:	in std_logic_vector(7 downto 0);
--		ancho	:	in std_logic_vector(7 downto 0);
--		pulso	:	out std_logic
--		);

u3: entity work.comparador(behavior) port map (conteo,ancho,pulso);


end architecture behavior;
