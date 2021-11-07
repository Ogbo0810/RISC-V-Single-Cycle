----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:50 11/03/2021 
-- Design Name: 
-- Module Name:    extender - Behavioral 
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

entity extender is 
	Port (
			imm_src_sel : in std_logic_vector(2 downto 0);
			data_in     : in  std_logic_vector(24 downto 0);
			data_out    : out std_logic_vector(31 downto 0)
			);
	end extender;

architecture Behavioral of extender is

--signal sig : std_logic_vector(31 downto 0);
	
begin
--data_out <= (others => data_in(24)) & data_in;
	process(data_in, imm_src_sel)
	begin
		case(imm_src_sel) is
		
		  
		   -- I-TYPE
			when "000" =>
			--   process(data_in)
				-- begin
				 if (data_in(24) = '0')then
					data_out <= "00000000000000000000" & data_in(24 downto 13);
				 else 
				   data_out <= "11111111111111111111" & data_in(24 downto 13);
				 end if;
				--end process;
				
				
			-- UPPER-IMMEDIATE	
			when "001" => 
			--   process(data_in)
			--	begin
				 if (data_in(24) = '0')then
					data_out <= "000000000000" & data_in(24 downto 5);
				 else 
				   data_out <= "111111111111" & data_in(24 downto 5);
				 end if;
				--end process;
				
				
				-- STORE	
			when "010" => 
			 --  process(data_in)
			--	begin
				 if (data_in(24) = '0')then
					data_out <= "00000000000000000000" & data_in(24 downto 18) & data_in(4 downto 0);
				 else 
				   data_out <= "11111111111111111111" & data_in(24 downto 18) & data_in(4 downto 0);
				 end if;
				--end process;
				
				
				-- BRANCH	--------
			when "011" => 
			  -- process(data_in)
			--	begin
				 if (data_in(5) = '0')then
					data_out <= "00000000000000000000" & data_in(5) & data_in(23 downto 18) & data_in(4 downto 1) & data_in(4);
				 else 
				   data_out <= "11111111111111111111" & data_in(5) & data_in(23 downto 18) & data_in(4 downto 1) & data_in(4);
				 end if;
				--end process;
				
				
				-- JUMP	--------
			when "100" => 
			--   process(data_in)
			--	begin
				 if (data_in(13) = '0')then
					data_out <= "000000000000" & data_in(13) & data_in(23 downto 14) & data_in(4) & data_in(12 downto 5);
				 else 
				   data_out <= "111111111111" & data_in(13) & data_in(23 downto 14) & data_in(4) & data_in(12 downto 5);
				 end if;
			--	end process;
			
			
			when others =>
			data_out <=x"00000000";
						
		end case;
	end process;



end Behavioral;

