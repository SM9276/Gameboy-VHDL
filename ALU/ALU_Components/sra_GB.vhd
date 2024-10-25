-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/17/24 >
-- Design Name : sra_GB
-- Module Name : sra_GB - behavioral
-- Project Name : <GameBoy_VHDL>
--
-- Description : 8-bit arithmetic right shift (SRA) unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;

entity sra_GB is
    port (
        A : IN std_logic_vector (7 downto 0) ;
        Y : OUT std_logic_vector (7 downto 0)
    ) ;
end sra_GB ;

architecture behavioral of sra_GB is
begin
    Y <= A(7) & A(7 downto 1);
end behavioral ;
    
