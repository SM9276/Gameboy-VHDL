-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/19/24 >
-- Design Name : sbc_GB
-- Module Name : sbc_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit bitwise SBC unit
-- ----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity sbc_GB is
    port (
        A,B,F : IN std_logic_vector (7 downto 0);
        Y, F_OUT : OUT std_logic_vector (7 downto 0)
) ;
end sbc_GB ;

architecture structural of sbc_GB is

component RippleCarryFullAdder_GB port(
--- Input ---    
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    Cin: in std_logic;
--- Output ---
    Sum: out std_logic_vector(7 downto 0);
    Cout: out std_logic );
end component; 

signal B_Comp : std_logic_vector(7 downto 0);

begin
    B_Comp <= not B;
    RippleCarryFullAdder_GB_inst: RippleCarryFullAdder_GB
     port map(
        A => A,
        B => B,
        Cin => F(4),
        Sum => Y,
        Cout => F_OUT(4)
    );
end structural ;
