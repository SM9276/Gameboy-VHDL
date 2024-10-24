-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/23/24 >
-- Design Name : add6   
-- Module Name : add6 - structural
-- Project Name : <GameBoy-VHDL>
--
-- Description : 4-bit add 6 unit
-- ----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity add6 is port (
--- Input ---    
    A    : in std_logic_vector(3 downto 0);
    op   : in std_logic;
--- Output ---    
    Y    : out std_logic_vector(3 downto 0);
    Cout : out std_logic);
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

signal carry : std_logic_vector(3 downto 0);
signal xor_out : std_logic_vector(3 downto 0);
constant six : std_logic_vector(3 downto 0):= "0110";
begin
    xor_out(0) <= six(0) xor op;
    xor_out(1) <= six(1) xor op;
    xor_out(2) <= six(2) xor op;
    xor_out(3) <= six(3) xor op;

    carry(0) <= op;
    FA0: FullAdder_GB
     port map(A => A(0), B => xor_out(0), Cin => carry(0), S => Y(0), Cout => carry(1));
    FA1: FullAdder_GB
     port map(A => A(1), B => xor_out(1), Cin => carry(1), S => Y(1), Cout => carry(2));
    FA2: FullAdder_GB
     port map(A => A(2), B => xor_out(2), Cin => carry(2), S => Y(2), Cout => carry(3));
    FA3: FullAdder_GB
     port map(A => A(3), B => xor_out(3), Cin => carry(3), S => Y(3), Cout => Cout);
end structural ;
