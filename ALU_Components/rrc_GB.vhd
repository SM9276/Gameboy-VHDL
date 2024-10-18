-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/14/24 >
-- Design Name : rrc_GB
-- Module Name : rrc_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit Rotate Right Carry unit
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity rrc_GB is
PORT (
    A, F : IN std_logic_vector (7 downto 0);
    Y, F_OUT : OUT std_logic_vector (7 downto 0)
) ;
end rrc_GB ;

architecture dataflow of rrc_GB is
begin
    Y <= F(4) & A(7 downto 1);
    F_OUT(4) <= A(0);
end dataflow ;
