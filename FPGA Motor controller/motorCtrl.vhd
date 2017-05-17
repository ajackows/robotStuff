----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:51:43 05/11/2017 
-- Design Name: 
-- Module Name:    motorCtrl - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity motorCtrl is
	
	port(
	
	SYSCLK_N: IN std_logic;
	SYSCLK_P: IN std_logic;
	
	FAN_PWM: OUT std_logic;
	
	led: out std_logic_vector (7 DOWNTO 0); -- simulate motor phases

	cpu_resetn : in std_logic;
	btnc : in std_logic; -- for direction
	btnl : in std_logic; -- start stop
	
	sw : in std_logic_vector (7 Downto 0) -- sets speed;
	
	);
	
end motorCtrl;

architecture Behavioral of motorCtrl is

	signal rst : std_logic;

	signal phase1 : std_logic;
	signal phase2 : std_Logic;
	signal phase3 : std_logic;
	
	signal direction : std_logic;
	
	signal clk : std_logic;

	signal counter : std_logic_vector(31 downto 0);
	signal speedCtrl : std_logic_vector(7 downto 0); 
	signal trigger : std_logic;
	
	type stateType is (stop, p12, p23,p31);
	signal state: stateType;
	
	signal pause: std_logic;

begin

	FAN_PWM <= '0';
	rst <= cpu_resetn;
	speedCtrl <= sw(7 downto 0);
	led(7) <= trigger; 

	IBUFGDS_inst : IBUFGDS
   generic map (
      DIFF_TERM => FALSE, -- Differential Termination 
      IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE)
      IOSTANDARD => "DEFAULT")
   port map (
      O => clk,  -- Clock buffer output
      I => SYSCLK_P,  -- Diff_p clock buffer input (connect directly to top-level port)
      IB => SYSCLK_N -- Diff_n clock buffer input (connect directly to top-level port)
   );


process(rst,clk) begin
	if(rst = '1') then
		counter <= (others => '0');
	end if;
	if (clk'EVENT and clk = '1')then
		counter <= counter + '1'; 
	end if;
end process;

-- assignment of phase signals
led(0) <= phase1;
led(1) <= phase2;
led(2) <= phase3;


--speed control uses a clock division to determine how fast the motor should go

with speedCtrl(7 downto 0) select
	trigger <= 	counter(31) when "00000001",
					counter(30) when "00000010",
					counter(29) when "00000011",
					counter(28) when "00000100",
					counter(27) when "00000101",
					counter(26) when "00000110",
					counter(25) when "00000111",
					counter(24) when "00001000",
					counter(23) when "00001001",
					counter(22) when "00001010",
					counter(21) when "00001011",
					counter(20) when "00001100",
					counter(19) when "00001101",
					counter(18) when "00001110",
					counter(17) when "00001111",
					'0' when others;

-- direction control input
process (btnc) begin
		if(btnc = '1') then
			if(direction = '1') then
				direction <= '0';
			else
				direction <= '1';
			end if;
		end if;
end process;


--stop control
--btnl toggles the pause
--rst stops system
--speedCtrl sets command to stop under normal operation
		--if speed control changes and no high priority stops are in place motor should continue

process (btnl, rst, speedCtrl) begin
	if(rst = '1' or speedCtrl = "00000000")then
		pause <= '1';
	elsif(btnl = '1') then
		if(pause = '1') then
			pause <= '0';
		else 
			pause <= '1';
		end if;
	else
			pause <= '0';
	end if;
end process;

--enable the phases in correct order based on speed and direction


process(trigger,rst,pause) begin
	if(rst = '1') then
		state <= stop;
	end if;

		case state is
		
		when stop => phase1 <= '0';
						 phase2 <= '0';
						 phase3 <= '0';
						
							if(pause = '0' and rst = '0') then
								state <= p12;
							else
								state <= stop;
							end if;
		when p12 => phase1 <= '1';
						phase2 <= '1';
						phase3 <= '0';
						
						if(pause = '1' or rst = '1')then
							state <= stop;
						end if;
						
						if(direction = '1') then
							state <= p23;
						elsif(direction = '0') then
							state <= p31;
						end if;
		when p23 => phase1 <= '0';
						phase2 <= '1';
						phase3 <= '1';
						
						if(pause = '1' or rst = '1') then
							state <= stop;
						end if;
						
						if(direction = '1') then
							state <= p31;
						elsif(direction = '0') then
							state <= p12;
						end if;
						
		when p31 => phase1 <= '1';
						phase2 <= '0';
						phase3 <= '1';
						
						if(pause = '1' or rst = '1') then
							state <= stop;
						end if;
						
						if(direction = '1') then
							state <= p12;
						elsif(direction = '0') then
							state <= p23;
						end if;
		end case;

end process;

end Behavioral;

