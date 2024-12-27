LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;	
--use ieee.std_logic_arith.all;
USE ieee.math_real.all;

package Common is 
	type reg_type is array (15 downto 0) of std_logic_vector(31 downto 0);
end package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;	
--use ieee.std_logic_arith.all;
USE ieee.math_real.all;

LIBRARY work;
use work.Common.all;

ENTITY DECIDER IS	
   PORT(
		clk100: 		IN  std_logic;
	
		DATA_in:		IN  std_logic_vector(7 downto 0);		
		
		DATA_out:		OUT  std_logic_vector(7 downto 0);
		
		rrdy: 			IN   std_logic;		
		Load:			OUT  std_logic;
		
		measured_data:	IN  std_logic_vector(15 downto 0)
   );
END DECIDER;

ARCHITECTURE arch OF DECIDER IS
BEGIN
	PROCESS (clk100)
	BEGIN
	if(clk100'event AND clk100='0')then
		Load<='0';
		if(rrdy='1')then
			case DATA_in is
				when "00000001"=>	DATA_out<=measured_data(7 downto 0);
				when "00000010"=>	DATA_out<=measured_data(15 downto 8);
				when "00000011"=>	DATA_out<="11001010";--0xCA
				when others=>null;
			end case;
			Load<='1';
		end if;
	end if;
	end process;
END arch;