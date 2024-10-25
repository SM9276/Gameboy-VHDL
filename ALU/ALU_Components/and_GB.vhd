-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/14/24 >
-- Design Name : and_GB
-- Module Name : and_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit bitwise AND unit
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity and_GB is
PORT (
    A : IN std_logic_vector (7 downto 0);
    B : IN std_logic_vector (7 downto 0);
    Y : OUT std_logic_vector (7 downto 0)
) ;
end and_GB ;

architecture dataflow of and_GB is
begin
    Y <= A and B ;
end dataflow ;
