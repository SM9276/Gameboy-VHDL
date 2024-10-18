-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/17/24 >
-- Design Name : sla_GB
-- Module Name : sla_GB - behavioral
-- Project Name : <GameBoy_VHDL >
--
-- Description : 8-bit arithmetic left shift (SLA) unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;

entity sla_GB is
    port (
        A : IN std_logic_vector (7 downto 0) ;
        Y : OUT std_logic_vector (7 downto 0)
    ) ;
end sla_GB ;

architecture behavioral of sla_GB is
    begin
        Y <= A(6 downto 0) & '0';
end behavioral ;

