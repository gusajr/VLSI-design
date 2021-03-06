library ieee;
use ieee.std_logic_1164.all;

entity freqDivider2 is
port(

	f50: in 		std_logic;
	fclk: out 	std_logic

);
end entity freqDivider2;

architecture behavior of freqDivider2 is
	signal clk: std_logic:='0';
	signal cnt: integer:=0;

begin
	fclk <= clk;
	
	process(f50)
	begin
		if rising_edge(f50) then
			if cnt=500000 then
				cnt<=0;
				clk<= not clk;
			else
				cnt <= cnt+1;
			end if;
		end if;
	end process;
end architecture behavior;