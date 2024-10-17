--- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/16/24 >
-- Design Name : srl_GB
-- Module Name : srl_GB - behavioral
-- Project Name : <GameBoy_VHDL>
--
-- Description : 8-bit logical right shift (SRL) unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;
entity srl_GB is
PORT (
A : IN std_logic_vector (7 downto 0) ;
SHIFT_AMT : IN std_logic_vector (2 downto 0) ;
Y : OUT std_logic_vector (7 downto 0)
) ;
end srl_GB ;
architecture behavioral of srl_GB is
-- create array of vectors to hold each of n shifters
type shifty_array is array (7 downto 0) of std_logic_vector (7 downto 0) ;
signal aSRL : shifty_array ;
begin
generateSRL : for i in 0 to 7 generate
aSRL ( i ) (7 - i  downto 0 ) <= A (7  downto i) ;
right_fill : if i > 0 generate
    aSRL(i)(7 downto 8 - i) <= (others => '0');
end generate right_fill ;
end generate generateSRL ;
-- The value of shift_amt (in binary ) determines number of bits A is,? shifted .
-- Since shift_amt (in decimal ) must not exceed n -1 so only M bits are,? used . The default or N=4 ,
-- will require 2 shift bits (M=2) , because 2^2 = 4 , the maximum shift,? .
-- In all cases , 2^M = N.
Y <= aSRL ( to_integer ( unsigned ( SHIFT_AMT ) ) ) ;
end behavioral ;

