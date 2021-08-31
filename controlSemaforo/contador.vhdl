library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; --Se usará para contar

entity contador is
port ( clk : in std_logic;
	R : out std_logic:='1'; --Dura 5 ciclos
	A : out std_logic:='0'; --Dura 1 ciclo
	V : out std_logic:='0' --Dura 4 ciclos
	);
end entity contador;

architecture behavior of contador is
	type states is (Rojo, Verde, Amarillo);
	signal state:states:=Rojo;
	signal cnt:std_logic_vector(2 downto 0):="000";
begin
	process (clk)
	begin
		if rising_edge(clk) then
			case state is
			when Rojo => 
					R<='1';
					A<='0';
					V<='0';
					if cnt = "100" then
						cnt <= "000";
						state <= Verde;
					else
						cnt <= cnt + '1';
					end if;

			when Verde =>
					R<='0';
					A<='0';
					V<='1';
					if cnt = "011" then
						cnt <= "000";
						state <= Amarillo;
					else
						cnt <= cnt + '1';
					end if;

			when Amarillo =>
					R<='0';
					A<='1';
					V<='0';
					state <= Rojo;		
			end case;
		end if;
	end process;
end architecture behavior;

