library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prak_tgs is
port ( x: in std_logic;
		 reset : in std_logic;
		 clock : in std_logic;
		 q : out std_logic_vector(2 downto 0) :="000";
		 s : out std_logic_vector(1 downto 0) :="00"
		 );
end prak_tgs;

architecture Behavioral of prak_tgs is
	type state_type is (S0, S1, S2, S3);
	signal next_state, current_state: state_type;
begin

state_reg: process (clock, reset)
begin
	if(reset='1')then
		current_state<=S0;
	elsif(clock'event and clock='1')then
		current_state<=next_state;
	end if;
end process;

comb_logic: process (current_state, x)
begin
	s<="00";
	case current_state is
		when S0 => s <= "00";
			if(x='0') then
			 q<="000";
			 next_state<=S0;
			elsif(x='1') then
			 q<="001";
			 next_state<=S1;
			end if;
		when S1 => s <= "01";
			if(x='0') then
			 q<="010";
			 next_state<=S0;
			elsif(x='1') then
			 q<="011";
			 next_state<=S2;
			end if;
		when S2 => s <= "10";
			if(x='0') then
			 q<="100";
			 next_state<=S2;
			elsif(x='1') then
			 q<="101";
			 next_state<=S3;
			end if;
		when S3 => s <= "11";
			if(x='0') then
			 q<="110";
			 next_state<=S1;
			elsif(x='1') then
			 q<="111";
			 next_state<=S0;
			end if;
	end case;
end process;
	
end Behavioral;

