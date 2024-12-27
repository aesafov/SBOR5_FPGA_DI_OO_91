LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;	
use ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.ALL;
ENTITY decoder_dig IS
   PORT
   (
		clock: 		IN std_logic;
		clk4: 		IN std_logic;
		clk_slow: 	IN std_logic;
		inputs_in:	IN std_logic_vector(0 to 15);
		output:		out std_logic;
		test:			out std_logic;
		test1:			out std_logic;
		measured_data:	out std_logic_vector(15 downto 0)
   );
END decoder_dig;

ARCHITECTURE arch OF decoder_dig IS
TYPE counts_type IS ARRAY (0 to 15) OF INTEGER range 0 to 64;
TYPE counts_type2 IS ARRAY (0 to 15) OF INTEGER range 0 to 1000000;
signal counts:	counts_type:=(others=>(0));
signal counts2:	counts_type2:=(others=>(700000));
signal reg:	std_logic_vector(0 to 15);
signal bitn:	integer range 0 to 128:=0;
signal nn:	integer range 0 to 15:=0;
signal last_input: 		std_logic_vector(0 to 15):="0000000000000000";
signal regout: 			std_logic:='0';
signal inputs:	 std_logic_vector(0 to 15):=(others=>'0');
BEGIN	
	slow:
	PROCESS (clk_slow)
	BEGIN
	IF (clk_slow'event AND clk_slow = '1') THEN
		inputs<=not inputs_in;
	END IF;	
	END PROCESS slow;
	--Decoder
	decode:
for n in 0 to 15 generate
	PROCESS (clock)
	BEGIN
	IF (clock'event AND clock = '1') THEN--10 MHz
			--Front
		--	if(inputs(n) /= last_input(n)) then
		--		counts(n)<=0;
		--	end if;				
			--Length		
			reg(n)<=reg(n);
			if(counts2(n)<(700000))then-- >1/15Hz, 70ms			
				counts2(n)<=counts2(n)+1;
			else
				if(counts(n)>30 and inputs(n)='1')then
					reg(n)<='1';
				end if;
				if(inputs(n)='0')then
					reg(n)<='0';
				end if;
			end if;
			--Signal
			if(inputs(n)='1')then
				if(counts(n)=30)then-- signal > 5 us
					counts2(n)<=0;
					reg(n)<='1';
					counts(n)<=counts(n)+1;					
				else
					if(counts(n)<30)then
						counts(n)<=counts(n)+1;
					end if;
				end if;	
			else
				counts(n)<=0;
			end if;	
			
			last_input(n)<=inputs(n);
	END IF;	
	END PROCESS;
end generate;
	--Encoder
	send_sm:
	PROCESS (clk4)
	BEGIN
	--measured_data<="1010110110111001";
	measured_data<=reg;
	IF (clk4'event AND clk4 = '1') THEN		
		bitn<=bitn+1;
		--not red
		test1<=not((reg(0) or reg(1) or reg(2) or reg(3) or reg(4) or reg(5) or reg(6) or reg(7) or reg(8)
		 or reg(9) or reg(10) or reg(11) or reg(12) or reg(13) or reg(14) or reg(15)));
		--not green
		test<='1';
		CASE (bitn) IS
			WHEN 0 to 4 =>
				output<='0';
				nn<=15;
			WHEN 5 to 68 =>
				if(std_logic_vector(to_unsigned(bitn,7))(1 downto 0)=b"00")then
					output<=not reg(nn);
					nn<=nn-1;
				else			
					output<=reg(nn);					
				end if;
			WHEN 69 to 78 =>
				output<='1';
			WHEN others =>
				output<='1';
				bitn<=0;
		END CASE;
	END IF;	
	END PROCESS send_sm;
END arch;