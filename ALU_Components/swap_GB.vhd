-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/17/24 >
-- Design Name : swap_GB
-- Module Name : swap_GB - behavioral
-- Project Name : <GameBoy_VHDL>
--
-- Description : 8-bit Swap unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;

entity swap_GB is
    port (
        A : IN std_logic_vector (7 downto 0) ;
        Y : OUT std_logic_vector (7 downto 0)
    ) ;
end swap_GB ;

architecture behavioral of swap_GB is
begin
    Y <= A(3 downto 0) & A(7 downto 4);
end behavioral ;
 
