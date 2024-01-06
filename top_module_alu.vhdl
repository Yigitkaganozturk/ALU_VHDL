library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_yit is
    Port ( num1    : in  std_logic_vector  (3 downto 0);
           num2    : in  std_logic_vector  (3 downto 0);
           sel     : in  std_logic_vector  (2 downto 0);
           func_o  : out std_logic_vector  (3 downto 0);
           overflow: out std_logic                    );
end alu_yit;

architecture Behavioral of alu_yit is
signal summation : std_logic_vector(3 downto 0) :="0000";
signal substr    : std_logic_vector(3 downto 0) :="0000";
signal increment : std_logic_vector(3 downto 0) :="0000";
signal bitand    : std_logic_vector(3 downto 0) :="0000";
signal onescomp  : std_logic_vector(3 downto 0) :="0000";
signal bitxor    : std_logic_vector(3 downto 0) :="0000";
signal llogshf   : std_logic_vector(3 downto 0) :="0000";
signal bitlrot   : std_logic_vector(3 downto 0) :="0000";
signal c_out     : std_logic_vector(3 downto 0) :="0000";

signal subsnum2  : std_logic_vector(3 downto 0) :="0000";
signal overflow1 : std_logic :='0';
signal c_inf123  : std_logic:='0';
signal num_eff   : std_logic_vector (3 downto 0):="0000";
signal mult_contr: std_logic_vector (1 downto 0):="00";
component four_bit_adder is
    Port ( num1     : in    std_logic_vector (3 downto 0);
           num2     : in    std_logic_vector (3 downto 0);
           sum_o    : out   std_logic_vector (3 downto 0);
           c_in     : in    std_logic                    ;
           overflow : out   std_logic);
end component four_bit_adder;
begin
mult_contr(0) <= sel(0);
mult_contr(1) <= sel(1);
with mult_contr select
 num_eff <= num2      when "00",
            not(num2) when "01",
            "0001"    when others;
with mult_contr select
 c_inf123 <= '0' when "00",
             '1' when "01",
             '0' when others;
F1 : four_bit_adder port map(num1 => num1, num2 => num_eff , c_in => c_inf123, sum_o => summation , overflow=>overflow1);

bitand(0) <= num1(0) and num2(0);
bitand(1) <= num1(1) and num2(1);
bitand(2) <= num1(2) and num2(2);
bitand(3) <= num1(3) and num2(3);
onescomp(0) <= not(num1(0));
onescomp(1) <= not(num1(1));
onescomp(2) <= not(num1(2));
onescomp(3) <= not(num1(3));
bitxor(0)   <= num1(0) xor num2(0);
bitxor(1)   <= num1(1) xor num2(1);
bitxor(2)   <= num1(2) xor num2(2);
bitxor(3)   <= num1(3) xor num2(3);
llogshf(0)<= '0';
llogshf(1)<= num1(0);
llogshf(2)<= num1(1);
llogshf(3)<= num1(2);
bitlrot(0)<= num1(3);
bitlrot(1)<= num1(0);
bitlrot(2)<= num1(1);
bitlrot(3)<= num1(2);
substr    <= summation;
increment <= summation;
with sel select
func_o <= summation when "000",
          substr    when "001",
          increment when "010",
          bitand    when "011",
          onescomp  when "100",
          bitxor    when "101", 
          llogshf   when "110",    
          bitlrot   when others;
with sel select
overflow <= overflow1 when "000",
            overflow1 when "001",
            overflow1 when "010",
            '0'      when others ;
end Behavioral;
