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
entity add6 is port (
--- Input ---    
    A    : in std_logic_vector (3 downto 0);
--- Output ---    
    Y    : OUT std_logic);
end add6 ;

architecture structural of add6 is

component FullAdder_GB port(
--- Input --- 
    A   : in STD_LOGIC;
    B   : in STD_LOGIC;
    Cin : in STD_LOGIC;
--- Output ---    
    S    : out STD_LOGIC;
    Cout : out STD_LOGIC
);
end component;

begin
    
end structural ;
