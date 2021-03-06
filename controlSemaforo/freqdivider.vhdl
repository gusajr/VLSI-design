library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all; --contador YA NO

entity freqdivider is
port(
	f50: in std_logic;
	clk: out std_logic --inout
);
end entity freqdivider;

architecture behavior of freqdivider is
	signal cnt: integer range 0 to 25000000 := 0;
	signal ck: std_logic := '0';
begin
	clk <= ck;
	process(f50)
	begin
		if rising_edge(f50) then
		
			if cnt = (25000000-1) then
				cnt <= 0;
				ck <= not ck;
			else
				cnt <= cnt + 1;
			end if;
		
		end if;
	end process;
end architecture behavior;

