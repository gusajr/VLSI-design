library ieee;
use ieee.std_logic_1164.all;

entity molino is
port(
	clk: in std_logic;
	S,I: in std_logic;
	M1: out std_logic:='0';
	M2: out std_logic:='0'
); 
end entity molino; --TOP DOWN, ARRIBA ABAJO

architecture behavior of molino is
	
	type states is (vacio,medio,lleno); --enum en C
	signal state: states:=vacio;
	
begin
	process(clk)
	begin
		if rising_edge(clk) then
		
			case state is
			when vacio => 	M1 <= '0';
								M2 <= '0';
								if I = '1' then
									state<=medio;
								end if;
				
			when medio =>	M1 <= '1';
								M2 <= '0';
								if I = '1' then
									if S = '1' then
										state <= lleno;
									end if;
								else
									state <= vacio;
								end if;
			
			when lleno =>	M1 <= '1';
								M2 <= '1';
								if S <= '0' then
									state<=medio;
								end if;
								
			end case;
		
		end if;
	end process;
end architecture behavior;
