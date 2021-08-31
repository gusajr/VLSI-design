library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; --cnt<=cnt+1;

entity contador is
port( clk: in std_logic;
		conteo: out std_logic_vector(7 downto 0)
	 );
end entity contador;

architecture behavior of contador is
	signal cnt:std_logic_vector (7 downto 0):=x"00";
begin

	--Q<=R;
	conteo<=cnt;
	process(clk)
	begin
		if rising_edge(clk) then --255
			if cnt=x"FF" then
				cnt<=x"00";
			else
				cnt<=cnt+1;
			end if;
		end if;
	end process;
	
end architecture behavior;