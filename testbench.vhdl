library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity simulation is
    --Port ( );
end simulation;

architecture Behavioral of simulation is
component alu_yit is
    Port ( num1    : in  std_logic_vector  (3 downto 0);
           num2    : in  std_logic_vector  (3 downto 0);
           sel     : in  std_logic_vector  (2 downto 0);
           func_o  : out std_logic_vector  (3 downto 0);
           overflow: out std_logic );
end component alu_yit;
signal num1 :std_logic_vector (3 downto 0):="0000";
signal num2 :std_logic_vector (3 downto 0):="0000";
signal sel  :std_logic_vector (2 downto 0):="000" ;
signal func_o :std_logic_vector (3 downto 0):="0000";
signal overflow :std_logic:='0' ;
begin
uut : alu_yit port map(num1 => num1, num2 => num2, sel => sel,func_o=>func_o,overflow=>overflow);
stim_proc : process
begin
num1 <= "0111";
num2 <= "0011";
sel<="000";
wait for 62.5ns;
num1 <= "1111";
num2 <= "0001";
sel<="000";
wait for 62.5ns;
num1 <= "0011";
num2 <= "0100";
sel<="000";
wait for 62.5ns;
num1 <= "0011";
num2 <= "0101";
sel<="001";
wait for 62.5ns;
num1 <= "1111";
num2 <= "0001";
sel<="001";
wait for 62.5ns;
num1 <= "0001";
num2 <= "1111";
sel<="001";
wait for 62.5ns;
num1 <= "0101";
num2 <= "0011";
sel<="001";
wait for 62.5ns;
num1 <= "0101";
num2 <= "0011";
sel<="010";
wait for 62.5ns;
num1 <= "0101";
num2 <= "1011";
sel<="011";
wait for 62.5ns;
num1 <= "0101";
num2 <= "1010";
sel<="011";
wait for 62.5ns;
num1 <= "0101";
num2 <= "0011";
sel<="100";
wait for 62.5ns;
num1 <= "0101";
num2 <= "0011";
sel<="101";
wait for 62.5ns;
num1 <= "0101";
num2 <= "0011";
sel<="110";
wait for 62.5ns;
num1 <= "1101";
num2 <= "0011";
sel<="110";
wait for 62.5ns;
num1 <= "1101";
num2 <= "0011";
sel<="111";
wait for 62.5ns;
num1 <= "0101";
num2 <= "0011";
sel<="111";
wait for 62.5ns;
end process;

end Behavioral;
