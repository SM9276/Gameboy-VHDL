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
entity daa_GB is port (
--- Input ---    
    A    : in std_logic_vector (7 downto 0);
    Cin  : in std_logic;
    Hin  : in std_logic; 
    Nin  : in std_logic;
--- Output ---    
    Y    : OUT std_logic_vector (7 downto 0);
    Cout : OUT std_logic);
end daa_GB ;

architecture structural of daa_GB is

    component greaterthen port(
    --- Input ---
        A : in std_logic_vector(3 downto 0);
    --- Output ---
        Y : out std_logic);
    end component;
    
    component add6 port(
    --- Input ---    
        A  : in std_logic_vector(3 downto 0);
        op : in std_logic;
    --- Output ---
        Y   : out std_logic_vector(3 downto 0);
        Cout: out std_logic);
    end component; 

    signal upperNibble : std_logic_vector(3 downto 0);
    signal lowerNibble : std_logic_vector(3 downto 0);

    signal upperOver   : std_logic;
    signal lowerOver   : std_logic;

    signal upperresult : std_logic_vector(3 downto 0);
    signal lowerresult : std_logic_vector(3 downto 0);

    signal upperCout   : std_logic;
    signal lowerCout   : std_logic;
    signal upper_out : std_logic_vector(3 downto 0);
    signal lower_out : std_logic_vector(3 downto 0);
    begin
        uppernibble <= A(7 downto 4);
        lowernibble <= A(3 downto 0);
        
        lower_gt: greaterthen
         port map( A => lowerNibble, Y => lowerOver );
        upper_gt: greaterthen
         port map( A => upperNibble, Y => upperOver );

        lowerAdd6 : add6
         port map( A => lowerNibble, op => Nin, Y => lowerresult, Cout => lowerCout);
        upperAdd6 : add6
         port map( A => upperNibble, op => Nin, Y => upperresult, Cout => upperCout);
        
    -- Select adjusted or unmodified nibbles for the final output
         -- Conditional assignment for the upper nibble
    upper_out <= upperResult when (upperOver = '1' or Cin = '1' or lowerCout = '1') else upperNibble;

    -- Conditional assignment for the lower nibble
    lower_out <= lowerResult when (lowerOver = '1' or Hin = '1') else lowerNibble;

    -- Concatenate the two adjusted nibbles for the final output
    Y <= upper_out & lower_out;

    -- Final carry-out from the upper nibble
    Cout <= uppercout;


end structural ;    

