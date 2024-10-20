-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/14/24 >
-- Design Name : xor_GB
-- Module Name : xor_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit bitwise XOR unit
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity xor_GB is
PORT (
    A : IN std_logic_vector (7 downto 0);
    B : IN std_logic_vector (7 downto 0);
    Y : OUT std_logic_vector (7 downto 0)
) ;
end xor_GB ;

architecture dataflow of xor_GB is
begin
    Y <= A xor B ;
end dataflow ;
