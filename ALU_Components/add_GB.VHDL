-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/14/24 >
-- Design Name : add_GB
-- Module Name : add_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 16-bit bitwise AND unit
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity and_GB is
PORT (
    A : IN std_logic_vector (15 downto 0);
    B : IN std_logic_vector (15 downto 0);
    C : IN std_logic;
    Y : OUT std_logic_vector (15 downto 0)
) ;
end add_GB ;

architecture dataflow of add_GB is
signal temp: unsigned(16 downto 0);
begin
    temp <= A add B ;
    Y <= temp(15 downto 0);
    C <= temp(16);
end dataflow ;
