-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/14/24 >
-- Design Name : rr_GB
-- Module Name : rr_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit Rotate Right unit
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity rr_GB is
PORT (
    A : IN std_logic_vector (7 downto 0);
    Y : OUT std_logic_vector (7 downto 0)
) ;
end rr_GB ;

architecture dataflow of rr_GB is
begin
    Y <= A(0) & A(7 downto 1);
end dataflow ;
