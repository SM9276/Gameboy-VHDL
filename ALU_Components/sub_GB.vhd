-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/19/24 >
-- Design Name : sub_GB
-- Module Name : sub_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit bitwise SUB unit
-- ----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity sub_GB is
    port (
    --- Input ---    
        A   : in std_logic_vector (7 downto 0);
        B   : in std_logic_vector (7 downto 0);
        Cin : in std_logic;
    --- Output ---
        Y : out std_logic_vector (7 downto 0);
        Cout : out std_logic;
        Hout : out std_logic
) ;
end sub_GB ;

architecture structural of sub_GB is

component RippleCarryFullAdder_GB port(
--- Input ---    
    A  : in std_logic_vector(7 downto 0);
    B  : in std_logic_vector(7 downto 0);
    Cin: in std_logic;
--- Output ---
    Sum : out std_logic_vector(7 downto 0);
    Cout: out std_logic;
    Hout: out std_logic );
end component; 

signal B_Comp : std_logic_vector(7 downto 0);

begin
    B_Comp <= not B;
    RippleCarryFullAdder_GB_inst: RippleCarryFullAdder_GB
     port map(
        A => A,
        B => B,
        Cin => Cin,
        Sum => Y,
        Cout => Cout,
        Hout => Hout
    );
end structural ;
