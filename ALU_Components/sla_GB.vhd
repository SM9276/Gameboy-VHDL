-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/17/24 >
-- Design Name : sll_GB
-- Module Name : sll_GB - behavioral
-- Project Name : <GameBoy_VHDL >
--
-- Description : 8-bit arithmetic left shift (SLA) unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;

entity sllN is
    port (
        A : IN std_logic_vector (7 downto 0) ;
        Y : OUT std_logic_vector (7 downto 0)
    ) ;
end sllN ;

architecture behavioral of sllN is
    begin
        Y <= A(6 downto 0) & '0';
end behavioral ;

