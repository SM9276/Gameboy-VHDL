library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarryFullAdder is
port(
--- Input ---    
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    OP: in std_logic;
--- Output ---
    Sum: out std_logic_vector(7 downto 0)    
 );
end RippleCarryFullAdder;

architecture oh_behave of RippleCarryFullAdder is
signal carry : std_logic_vector(8 downto 0);
signal xor_out: std_logic_vector(7 downto 0);

component FullAdder port(
--- Input --- 
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
--- Output ---    
    S : out STD_LOGIC;
    Cout : out STD_LOGIC
);
end component;

begin
    carry(0) <= OP;
    ripple: for i in 0 to 7 generate
        xor_out(i) <= B(i) xor OP;
        FullAdder_inst : FullAdder
        port map(
            -- Inputs
            A => A(i),
            B => xor_out(i),
            Cin => carry(i),
            -- Outputs
            S => Sum(i),
            Cout => carry(i+1)
        );
    end generate;
end oh_behave;

