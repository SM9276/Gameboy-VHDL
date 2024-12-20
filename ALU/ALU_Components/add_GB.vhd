-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/19/24 >
-- Design Name : add_GB
-- Module Name : add_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit bitwise ADD unit
-- ----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity add_GB is port (
--- Input ---    
    A    : in  std_logic_vector (7 downto 0);
    B    : in  std_logic_vector (7 downto 0);
    Cin  : in  std_logic;
    Y    : OUT std_logic_vector (7 downto 0);
    Cout : OUT std_logic;
    Hout : OUT std_logic

) ;
end add_GB ;

architecture structural of add_GB is

component RippleCarryFullAdder_GB port(
--- Input ---    
    A  : in std_logic_vector(7 downto 0);
    B  : in std_logic_vector(7 downto 0);
    Cin: in std_logic;
--- Output ---
    Sum : out std_logic_vector(7 downto 0);
    Cout: out std_logic; 
    Hout: out std_logic);
end component; 

signal Y_OUT : std_logic_vector(7 downto 0);
begin
    RippleCarryFullAdder_GB_inst: RippleCarryFullAdder_GB port map(
    --- Input ---    
        A => A,
        B => B,
        Cin => Cin,
    --- Output ---
        Sum => Y,
        Cout => Cout,
        Hout => Hout
    );
end structural ;

