
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; --cnt<=cnt + 1;

entity freqdivider is
port(	f50	: in 		std_logic;
		clk	: out 	std_logic
	 );
end entity freqdivider;

architecture behavior of freqdivider is
	--signal cnt: std_logic_vector (11 downto 0):=x"000";
	signal cnt: integer range 0 to 1952:=0;
	signal ck: std_logic:='0';
begin
	clk <= ck;
	
	process(f50)
	begin
		if rising_edge(f50) then --pregunta por la transicion positiva
			
			if cnt = 1952 then
				cnt <= 0;
				ck <= not ck;
			else
				cnt<=cnt+1;
			end if;
			
		end if;
	end process;
	
end architecture behavior;
