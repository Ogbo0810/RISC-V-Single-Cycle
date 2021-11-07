	----------------------------------------------------------------------------------
	-- Company: 
	-- Engineer: 
	-- 
	-- Create Date:    16:10:34 11/05/2021 
	-- Design Name: 
	-- Module Name:    RISC_V_CONTROL_UNIT - Behavioral 
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

	entity RISC_V_CONTROL_UNIT is
	Port(
	     zero,clk              : in  std_logic;
		  funct_7               : in  std_logic_vector(6 downto 0);
		  funct_3               : in  std_logic_vector(2 downto 0);
		  opcode                : in  std_logic_vector(6 downto 0);
		  pc_src                : out std_logic;
		  result_src            : out std_logic;
		  dm_write_enable       : out std_logic;
		  alu_control           : out std_logic_vector(3 downto 0);
		  alu_src               : out std_logic;
		  imm_src_sel           : out std_logic_vector(2 downto 0);
		  reg_file_write_enable : out std_logic	  
	     );
	end RISC_V_CONTROL_UNIT;
	
	

	architecture Behavioral of RISC_V_CONTROL_UNIT is
   
	
	
	type state_type is (S0,S1,S2,S3,S4,S5);
	signal PS,NS : state_type;

	begin

	  state_reg: process(clk, reset)
	  begin
		 if (reset = '1') then
			PS <= S0;
		 elsif (rising_edge(clk)) then
			PS <= NS;
		 end if;
	  end process;
	  
	  
	  next_state_logic: process(PS,done)
	  begin

		 case PS is
		 
		 when S0 => 
		 NS <= S1;
			
		 when S1 => 
		 NS <= S2;
			 
			  
		 when S2 => 
		 if (Done = '0') then 
		  NS <= S3;
		 elsif (Done = '1') then 
			NS <= S5;
		 end if;
			  
			
		 when S3 => 
		 NS <= S4;
			 
			 
		 when S4 => 
		 NS <= S1;
			 
			
		 when S5 =>
		 NS <= S5;
			 
		 end case;
	  end process;
	  
	  
	  
	  output_logic : process(PS)
	  begin
				case PS is
				
				when S0 =>
				Sel      <= '0';
				plain_text_load <= '1';
				key_load <= '1';
				Count_enable <= '0';
			  
				when S1 =>
				Sel      <= '0';
				plain_text_load <= '0';
				key_load <= '0';
				Count_enable <= '0';
				
				when S2 =>
				Sel       <= '0';
				plain_text_load <= '0';
				key_load <= '0';
				Count_enable <= '0';
			  
				when S3 =>
				Sel      <= '0';
				plain_text_load <= '0';
				key_load <= '0';
				Count_enable <= '0';
				
				when S4 =>
				Sel      <= '1';
				plain_text_load <= '1';
				key_load <= '1';
				Count_enable <= '0';
				
				when S5 => 
				Sel      <= '0';
				plain_text_load <= '0';
				key_load <= '0';
				Count_enable <= '1';
			
			  end case;
		  end process;
	  
			  
				
	  
	end Behavioral;