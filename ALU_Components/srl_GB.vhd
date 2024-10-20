--- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/16/24 >
-- Design Name : srl_GB
-- Module Name : srl_GB - behavioral
-- Project Name : <GameBoy_VHDL>
--
-- Description : 8-bit logical right shift (SRL) unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;

entity srl_GB is
    port (
        A : IN std_logic_vector (7 downto 0) ;
        Y : OUT std_logic_vector (7 downto 0)
    ) ;
end srl_GB ;

architecture behavioral of srl_GB is
    begin
        Y <= '0' & A(7 downto 1);
end behavioral ;

