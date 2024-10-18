-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/14/24 >
-- Design Name : rlc_GB
-- Module Name : rlc_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit Rotate Left Carry unit
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity rlc_GB is
PORT (
    A, F : IN std_logic_vector (7 downto 0);
    Y, F_OUT: OUT std_logic_vector (7 downto 0)
) ;
end rlc_GB ;

architecture dataflow of rlc_GB is
begin
    Y <= A(6 downto 0) & F(4);
    F_OUT(4) <= A(7);
end dataflow ;
