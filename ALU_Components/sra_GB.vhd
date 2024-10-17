-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/17/24 >
-- Design Name : sra_GB
-- Module Name : sra_GB - behavioral
-- Project Name : <GameBoy_VHDL>
--
-- Description : 8-bit arithmetic right shift (SRA) unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;
entity sraN is
PORT (
A : IN std_logic_vector (7 downto 0) ;
SHIFT_AMT : IN std_logic_vector (2 downto 0) ;
Y : OUT std_logic_vector (7 downto 0)
) ;
end sraN ;
architecture behavioral of sraN is
-- create array of vectors to hold each of n shifters
type shifty_array is array (7 downto 0) of std_logic_vector (7 downto 0) ;
signal aSRL : shifty_array ;
begin
generateSRL : for i in 0 to 7 generate
aSRL ( i ) (7 - i  downto 0 ) <= A (7  downto i) ;
right_fill : if i > 0 generate
    aSRL(i)(7 downto 8 - i) <= (others => A(7));
end generate right_fill ;
end generate generateSRL ;
Y <= aSRL ( to_integer ( unsigned ( SHIFT_AMT ) ) ) ;
end behavioral ;
    
