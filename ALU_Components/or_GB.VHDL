-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/14/24 >
-- Design Name : or_GB
-- Module Name : or_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 16-bit bitwise OR unit
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity or_GB is
PORT (
    A : IN std_logic_vector (15 downto 0);
    B : IN std_logic_vector (15 downto 0);
    Y : OUT std_logic_vector (15 downto 0)
) ;
end or_GB ;

architecture dataflow of or_GB is
begin
    Y <= A or B ;
end dataflow ;

