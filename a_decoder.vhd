	----------------------------------------------------------------------------------
	-- Company: 
	-- Engineer: 
	-- 
	-- Create Date:    16:33:41 11/09/2021 
	-- Design Name: 
	-- Module Name:    a_decoder - Behavioral 
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
	use IEEE.NUMERIC_STD.ALL;

	-- Uncomment the following library declaration if instantiating
	-- any Xilinx primitives in this code.
	--library UNISIM;
	--use UNISIM.VComponents.all;

	entity m_decoder is
	Port (
			opcode                : in  std_logic_vector(6 downto 0);
			branch                : out std_logic;
			result_src            : out std_logic_vector(1 downto 0);
			dm_write_enable       : out std_logic;
			alu_src               : out std_logic;
			imm_src_sel           : out std_logic_vector(2 downto 0);
			reg_file_write_enable : out std_logic;
			alu_op                : out std_logic_vector(1 downto 0)
			);
	end m_decoder;

	architecture Behavioral of m_decoder is
	
	
	begin
	
	process(opcode)
		begin
			case opcode is 
			
			when "0000011" =>
				branch                <= '0';
				result_src            <= "01";
				dm_write_enable       <= '0';   ----i-tYPE/ load
				alu_src               <= '1'; -----
				imm_src_sel           <= "000";
				reg_file_write_enable <= '1';
				alu_op                <= "00";
			
			when "0010011" =>
				branch                <= '0';
				result_src            <= "00";
				dm_write_enable       <= '0';   ----i-tYPE/ arith immediate
				alu_src               <= '1';
				imm_src_sel           <= "000";
				reg_file_write_enable <= '1';
				alu_op                <= "01";
				
			when "0100011" =>
				branch                <= '0';
				result_src            <= "00"; --DON'T CARE --- S
				dm_write_enable       <= '1';
				alu_src               <= '1';
				imm_src_sel           <= "001";
				reg_file_write_enable <= '0';
				alu_op                <= "00";
				
			when "0110011" =>
				branch                <= '0';
				result_src            <= "00";
				dm_write_enable       <= '0';    ---- R
				alu_src               <= '0';
				imm_src_sel           <= "000"; --DON'T CARE
				reg_file_write_enable <= '1';
				alu_op                <= "10";
				
			when "1100011" =>
				branch                <= '1';
				result_src            <= "00"; -- DON'T CARE
				dm_write_enable       <= '0';
				alu_src               <= '0';   -- B
				imm_src_sel           <= "010";
				reg_file_write_enable <= '0';
				alu_op                <= "11";
				
			when others =>
				branch                <= '0';
				result_src            <= "00"; -- DON'T CARE
				dm_write_enable       <= '0';
				alu_src               <= '0';
				imm_src_sel           <= "000";
				reg_file_write_enable <= '0';
				alu_op                <= "00";
				

			end case;
		end process;

	end Behavioral;

