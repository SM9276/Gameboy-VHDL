-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/20/24 >
-- Design Name : dda_GB
-- Module Name : dda_GB - structural
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit bitwise ADD unit
-- ----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity dda_GB is port (
--- Input ---    
    A    : in std_logic_vector (7 downto 0);
    B    : in std_logic_vector (7 downto 0);
    Cin  : in std_logic;
    Hin  : in std_logic; 
    Nin  : in std_logic;
--- Output ---    
    Y    : OUT std_logic_vector (7 downto 0);
    Cout : OUT std_logic);
end dda_GB ;

architecture structural of dda_GB is

    component greaterthen port(
    --- Input ---
        A : in std_logic_vector(3 downto 0);
    --- Output ---
        Y : out std_logic);
    end component;
    
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

    signal upperNibble : std_logic_vector(3 downto 0);
    signal lowerNibble : std_logic_vector(3 downto 0);
    signal upperOver   : std_logic;
    signal lowerOver   : std_logic;
    signal not_B       : std_logic_vector(7 downto 0);
     
    signal upperNibble_addresult : std_logic_vector(7 downto 0);
    signal lowerNibble_addresult : std_logic_vector(7 downto 0);
    signal upperNibble_subresult : std_logic_vector(7 downto 0);
    signal lowerNibble_subresult : std_logic_vector(7 downto 0);

    begin
        RippleCarryFullAdder_GB_inst: RippleCarryFullAdder_GB
         port map(
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout,
            Hout => Hout
        );
end structural ;

