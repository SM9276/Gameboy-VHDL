-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/23/24 >
-- Design Name : greaterthen
-- Module Name : greaterthen - structural
-- Project Name : <GameBoy-VHDL>
--
-- Description : 4-bit greaterthen 1001 unit
-- ----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity greaterthen is port (
--- Input ---    
    A    : in std_logic_vector (3 downto 0);
--- Output ---    
    Y    : OUT std_logic);
end greaterthen ;

architecture dataflow of greaterthen is
begin
   Y <= A(3) and (A(2) or A(1));
end dataflow ;
