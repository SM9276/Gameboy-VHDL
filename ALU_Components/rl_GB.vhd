-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/14/24 >
-- Design Name : rl_GB
-- Module Name : rl_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit Rotate Left unit
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity rl_GB is
PORT (
    A : IN std_logic_vector (7 downto 0);
    Y : OUT std_logic_vector (7 downto 0)
) ;
end rl_GB ;

architecture dataflow of rl_GB is
begin
    Y <= A(6 downto 0) & A(7);
end dataflow ;
