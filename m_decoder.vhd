	----------------------------------------------------------------------------------
	-- Company: 
	-- Engineer: 
	-- 
	-- Create Date:    16:33:24 11/09/2021 
	-- Design Name: 
	-- Module Name:    m_decoder - Behavioral 
	-- Project Name: 
	-- Target Devices: 
	-- Tool versions: 
	-- Description: 
	--
	-- Dependencies: 
	--
	-- Revision: 
	-- Revision 0.01 - File Created
	-- Additional Comments: 
	--
	----------------------------------------------------------------------------------
	library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

	-- Uncomment the following library declaration if using
	-- arithmetic functions with Signed or Unsigned values
	--use IEEE.NUMERIC_STD.ALL;

	-- Uncomment the following library declaration if instantiating
	-- any Xilinx primitives in this code.
	--library UNISIM;
	--use UNISIM.VComponents.all;

	entity a_decoder is
			Port (
			funct_3     : in  std_logic_vector(2 downto 0);
			op_and_f7   : in  std_logic_vector(1 downto 0);
			alu_op      : in  std_logic_vector(1 downto 0);
			alu_control : out std_logic_vector(3 downto 0)	
			);
			

	end a_decoder;

	architecture Behavioral of a_decoder is
	
	--signal op_and_f7_sig    : std_logic_vector(1 downto 0);
	--signal funct_3_sig     : std_logic_vector(2 downto 0);
	--signal alu_control_sig : std_logic_vector(3 downto 0);
	signal funct_3_op_and_f7 : std_logic_vector(4 downto 0);
	begin
   
	funct_3_op_and_f7 <= funct_3 & op_and_f7;
	
	
	process(alu_op, funct_3_op_and_f7 )
		begin
		
			case (alu_op) is
			
				when "00" => --lw, sw
						alu_control <= "0001";
						
						
				when "01" => --I-TYPE
					   case (funct_3) is 
					
							when "000" => --addI
						      alu_control <= "0001";	
							when "111" => --andI
						      alu_control <= "0011";
							when "110" => --orI
								alu_control <= "0100";
							when "100" => --xorI
								alu_control <= "0101";
							when "010" => --sltI
								alu_control <= "1000";
							when others => 
								alu_control <= "0000";
		
					   end case;
						
						
				when "10" => --R-TYPE
						case(funct_3_op_and_f7) is 
							when "00000" => --add
								alu_control <= "0001";
							when "00001" => --add
								alu_control <= "0001";
							when "00010" => --add
								alu_control <= "0001";
							when "00011" => --sub
								alu_control <= "0010";
							when "11100" | "11101" | "11110"| "11111" => --and
							   alu_control <= "0011";
							when "11000" | "11001" | "11010" | "11011" => --or
								alu_control <= "0100";
							when "10000" | "10001" | "10010" |"10011" => --xor
								alu_control <= "0101";
							when "01000" | "01001" | "01010" | "01011" => --slt
								alu_control <= "1000";
							when others =>
							   alu_control <= "0000";
						end case;
						
						
				when "11" => --BEQ
						alu_control <= "0010";
				
				when others => 
								alu_control <= "0000";		
			end case;
	end process;
			
			
--			
--			IF (alu_op <= "00") then 			--LOAD AND STORE WORD 
--				IF ((funct_3 <= "000") and (op_and_f7 <= "00") ) then
--					
--				END IF;
--			end IF;
--				
--				
--			IF (alu_op <="01") then  --BEQ 
--				IF ((funct_3 <= "000") and (op_and_f7 <= "00") ) then
--					alu_control <= "0001";
--				END IF;
--			END IF;
--				
--				
--			IF (alu_op <= "10") THEN  
--			
--			   --ADD
--            IF ((funct_3 <= "000") and (op_and_f7 <= "00" or op_and_f7 <= "01" or op_and_f7 <= "10")) then
--					alu_control <= "0000";
--				END IF;
--				
--				
--				--SUBTRACTION
--            IF ((funct_3 <= "000") and (op_and_f7 <= "11")) then
--					alu_control <= "0001";
--				END IF;
--				
--				
--				--SET LESS THAN
--				IF((funct_3 <= "010") and (op_and_f7 <= "00" )) then
--					alu_control <= "0101";				
--				END IF;
--				
--				
--				--OR
--				IF((funct_3 <= "110") and (op_and_f7 <= "00")) then
--					alu_control <= "0010";				
--				END IF;
--				
--				--AND
--				IF((funct_3 <= "111") and (op_and_f7 <= "00")) then
--					alu_control <= "0011";				
--				END IF;
--				
--				
--			 END IF;
--				
--				
-- 
--				alu_control <= "0111";
--				
--		end process;
		
		--alu_control   <= alu_control_sig;
		--funct_3_sig   <= funct_3;
		--op_and_f7_sig <= op_and_f7;

	end Behavioral;

