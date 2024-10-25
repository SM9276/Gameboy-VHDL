-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/14/24 >
-- Design Name : and_GB
-- Module Name : and_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit bitwise AND unit
-- ----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity FullAdder_GB is
 Port (
--- Input --- 
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
--- Output ---    
    S : out STD_LOGIC;
    Cout : out STD_LOGIC
);
end FullAdder_GB;
 
architecture dataflow of FullAdder_GB is begin
    S <= A XOR B XOR Cin ;
    Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;
end dataflow;
