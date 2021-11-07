----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:27 11/02/2021 
-- Design Name: 
-- Module Name:    instruction_memory - Behavioral 
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

entity instruction_m is

--Generic (
--B : integer := 32;
--N : integer := 4
--);

Port (
--clk             : in std_logic;
program_counter : in  std_logic_vector(3 downto 0);
instruction     : out std_logic_vector (31 downto 0)
);


end instruction_m;


architecture Behavioral of instruction_m is

type IM_type is array (0 to 15) of
std_logic_vector(31 downto 0);

signal IM : IM_type  := (
                         others => (others => '0')
								 );
																
		

begin

--process(clk)
  --begin
    --if (rising_edge(clk)) then
	   instruction <= IM(to_integer(unsigned(program_counter)));
	 --end if;
  --end process;

end Behavioral;

