-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/20/24 >
-- Design Name : dda_GB
-- Module Name : dda_GB - structural
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit bitwise ADD unit
-- ----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity dda_GB is port (
--- Input ---    
    A    : in std_logic_vector (7 downto 0);
    B    : in std_logic_vector (7 downto 0);
    Cin  : in std_logic;
    Hin  : in std_logic; 
--- Output ---    
    Y    : OUT std_logic_vector (7 downto 0);
    Cout : OUT std_logic;
    Hout : OUT std_logic

) ;
end dda_GB ;

architecture structural of dda_GB is

begin

end structural ;

