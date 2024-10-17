-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/17/24 >
-- Design Name : sll_GB
-- Module Name : sll_GB - behavioral
-- Project Name : <GameBoy_VHDL >
--
-- Description : 8-bit arithmetic left shift (SLA) unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;
entity sllN is
PORT (
    A : IN std_logic_vector (7 downto 0) ;
    SHIFT_AMT : IN std_logic_vector (2 downto 0) ;
    Y : OUT std_logic_vector (7 downto 0)
) ;
end sllN ;
architecture behavioral of sllN is
-- create array of vectors to hold each of n shifters
type shifty_array is array (7 downto 0) of std_logic_vector (7 downto 0) ;
signal aSLL : shifty_array ;
begin
generateSLL : for i in 0 to 7 generate
aSLL ( i ) (7 downto i ) <= A (7 - i downto 0) ;
left_fill : if i > 0 generate
    aSLL(i)(i-1 downto 0) <= (others => '0'); --Must Replace other => '0'
end generate left_fill ;
end generate generateSLL ;
Y <= aSLL ( to_integer ( unsigned ( SHIFT_AMT ) ) ) ;
end behavioral ;

