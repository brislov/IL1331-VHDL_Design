library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder is -- 4 bit 
	port(
		i_num1 : in std_logic_vector(3 downto 0); 
		i_num2 : in std_logic_vector(3 downto 0);
		i_cin  : in std_logic;
		o_cout : out std_logic;
		o_sum  : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behavior of ripple_carry_adder is
	component full_adder
		port(
			i_bit1  : in std_logic;
			i_bit2  : in std_logic;
			i_carry : in std_logic;
			o_carry : out std_logic;
			o_sum   : out std_logic
		);
	end component;
	
	signal w_c12, w_c23, w_c34 : std_logic; -- intermediate carry wires
	
	begin
	FA1: full_adder port map(i_num1(0), i_num2(0), i_cin, w_c12, o_sum(0));
	FA2: full_adder port map(i_num1(1), i_num2(1), w_c12, w_c23, o_sum(1));
	FA3: full_adder port map(i_num1(2), i_num2(2), w_c23, w_c34, o_sum(2));
	FA4: full_adder port map(i_num1(3), i_num2(3), w_c34, o_cout, o_sum(3));
end architecture;
