----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:11 11/02/2021 
-- Design Name: 
-- Module Name:    register_file_32 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file_32 is

	--Generic (
	--B : integer := 32;
	--N : integer := 5
	--);

	Port (
	clk,write_enable: in  std_logic;
	read_address_1  : in  std_logic_vector(4 downto 0);
	read_address_2  : in  std_logic_vector(4 downto 0);
	write_address   : in  std_logic_vector(4 downto 0);
	write_data      : in  std_logic_vector(31 downto 0);
	read_data_1     : out std_logic_vector(31 downto 0);
	read_data_2     : out std_logic_vector(31 downto 0)
	);
	
end register_file_32;

architecture Behavioral of register_file_32 is

	type reg_file_type is array (0 to 31) of --THE REIGISTER FILE IS AN ARRAY WITH 32 REGISTERS
   std_logic_vector(31 downto 0);--EACH OF THE REGISTERS ARE 32 BITS
	  
	signal register_file : reg_file_type := (
															 others => (others => '0')
	   													 );
--	                                           x"00000000",  --zero
--															 x"00000000",  --ra
--															 x"00000000",  --sp
--															 x"00000000",  --gp
--															 x"00000000",  --tp
--															 x"00000000",  --t0
--															 x"00000000",  --t1
--															 x"00000000",  --t2
--															 x"00000000",  --s0/fp
--															 x"00000000",  --s1  
--															 x"00000000",  --a0  
--															 x"00000000",  --a1
--															 x"00000000",  --a2
--															 x"00000000",  --a3
--															 x"00000000",  --a4
--															 x"00000000",  --a5
--															 x"00000000",  --a6
--															 x"00000000",  --a7
--															 x"00000000",  --s2
--															 x"00000000",  --s3
--															 x"00000000",  --s4
--															 x"00000000",  --s5  
--															 x"00000000",  --s6 
--															 x"00000000",  --s7 
--															 x"00000000",  --s8
--															 x"00000000",  --s9
--															 x"00000000",  --s10
--															 x"00000000",  --s11
--															 x"00000000",  --t3
--															 x"00000000",  --t4  
--															 x"00000000",  --t5
--															 x"00000000"   --t6



begin

	process(clk, write_enable)
	  begin
		  IF (rising_edge(clk)) then
		  
			 if (write_enable = '1') then
				register_file(to_integer(unsigned(write_address))) <= write_data;
			 end if;
			 
		  end IF;
	  end process;

		read_data_1 <= register_file(to_integer(unsigned(read_address_1))) ;
		read_data_2 <= register_file(to_integer(unsigned(read_address_2))) ;
end Behavioral;

