--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:32:18 12/07/2020
-- Design Name:   
-- Module Name:   E:/VLSI/Praktikum/FPGA/FSM_Prak/prak_tgs_tb.vhd
-- Project Name:  FSM_Prak
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: prak_tgs
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY prak_tgs_tb IS
END prak_tgs_tb;
 
ARCHITECTURE behavior OF prak_tgs_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT prak_tgs
    PORT(
         x : IN  std_logic;
         reset : IN  std_logic;
         clock : IN  std_logic;
         q : OUT  std_logic_vector(2 downto 0);
         s : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(2 downto 0);
   signal s : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: prak_tgs PORT MAP (
          x => x,
          reset => reset,
          clock => clock,
          q => q,
          s => s
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '1';
		wait for 5 ns;
		clock <= '0';
		wait for 5 ns;
   end process;
 
	stim_proc: process
		variable err_cnt: integer :=0;
	begin
	
	--tetap s0
	reset<= '1';
	x<= '0';
	wait for 20ns;
	assert (q="000") report "Failed Case 1" severity error;
	if (q/="000") then
		err_cnt:=err_cnt+1;
	end if;
	
	reset <= '0';
	x <= '0';-- ke s0
	wait for 10 ns;
	x <= '1';-- ke s1
	wait for 10 ns;
	x <= '0';-- ke s0
	wait for 10 ns;
	
	x <= '1';-- ke s1
	wait for 10 ns;
	x <= '1';-- ke s2
	wait for 10 ns;
	x <= '0';-- ke s2
	wait for 10 ns;
	
	x <= '1';-- ke s3
	wait for 10 ns;
	x <= '0';-- ke s1
	wait for 10 ns;
	x <= '1';-- ke s2
	wait for 10 ns;
	
	x <= '1';--ke s3
	wait for 10 ns;
	x <= '1';--ke s0
	wait for 10 ns;
	
	wait for 10 ns;
	reset<='1';
	
end process;

END;
