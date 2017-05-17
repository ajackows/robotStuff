----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:25 05/12/2017 
-- Design Name: 
-- Module Name:    BrushlessControllerCore - Behavioral 
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

entity BrushlessControllerCore is
    Port ( Clk : in  STD_LOGIC;
           AP : out  STD_LOGIC; -- A high
           AN : out  STD_LOGIC; -- A low
           BP : out  STD_LOGIC; -- B high
           BN : out  STD_LOGIC; -- B low
           CP : out  STD_LOGIC; -- C high
           CN : out  STD_LOGIC; -- C low
           Opcode : in  STD_LOGIC_VECTOR(7 downto 0);
           rst : in  STD_LOGIC;
			  
			  ADCA : in std_logic_vector; -- adc from coil A
			  ADCB : in std_logic_vector; -- adc from coil B
			  ADCC : in std_logic_vector -- adc from coil C
			  
			  );
end BrushlessControllerCore;

architecture Behavioral of BrushlessControllerCore is


	signal trigger : std_logic;
	
	type stateType is (stop,p1,p2,p3,p4,p5,p6);
	signal state: stateType;
	

begin


end Behavioral;

