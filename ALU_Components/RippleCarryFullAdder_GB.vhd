-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/15/24 >
-- Design Name : RippleCarryFullAdder_GB
-- Module Name : RippleCarryFullAdder_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit bitwise Ripple Carry Adder unit
-- ----------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarryFullAdder_GB is
port(
--- Input ---    
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    Cin: in std_logic;
--- Output ---
    Sum: out std_logic_vector(7 downto 0);
    Cout: out std_logic
 );
end RippleCarryFullAdder_GB;

architecture oh_behave of RippleCarryFullAdder_GB is
signal carry : std_logic_vector(8 downto 0);
signal xor_out: std_logic_vector(7 downto 0);

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
    carry(0) <= Cin;
    ripple: for i in 0 to 7 generate
        FullAdder_inst : FullAdder_GB
        port map(
            -- Inputs
            A => A(i),
            B => B(i),
            Cin => carry(i),
            -- Outputs
            S => Sum(i),
            Cout => carry(i+1)
        );
    end generate;
    Cout <= carry(8);
end oh_behave;

