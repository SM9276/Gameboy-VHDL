-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/13/24 >
-- Design Name : ALU_GB
-- Module Name : ALU_GB - structural
-- Project Name : <Gameboy-VHDL>
--
-- Description : 16-bit Arithmetic Logic Unit for the GameBoy
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;

entity ALU_GB is
PORT (
--- Input ---
    in1:     IN std_logic_vector (15 downto 0) ;
    in2:     IN std_logic_vector (15 downto 0) ;
    control: IN std_logic_vector(4 downto 0);
--- Output ---
    out1 :   OUT std_logic_vector (15 downto 0)
    carry :  Out std_logic
) ;
end aluN ;

architecture structural of aluN is

-- or component declaration
Component or is
PORT (
--- Input ---
    A : IN std_logic_vector (15 downto 0) ;
    B : IN std_logic_vector (15 downto 0) ;
--- Output ---
    Y : OUT std_logic_vector (15 downto 0)
) ;
end Component ;

-- and component declaration
Component andN is
PORT (
--- Input ---
    A : IN std_logic_vector (15 downto 0) ;
    B : IN std_logic_vector (15 downto 0) ;
--- Output ---
    Y : OUT std_logic_vector (15 downto 0)
) ;
end Component ;

-- xor component declaration
Component xorN is
GENERIC ( N : INTEGER := 32) ; -- bit width
PORT (
--- Input ---
    A : IN std_logic_vector (15 downto 0) ;
    B : IN std_logic_vector (15 downto 0) ;
--- Output ---
    Y : OUT std_logic_vector (15 downto 0)
) ;
end Component ;

-- sll component declaration
Component sllN is
GENERIC ( N : INTEGER := 32; -- bit width
          M : INTEGER := 5) ; --shift bits
PORT (
--- Input ---
    A : IN std_logic_vector (15 downto 0) ;
    SHIFT_AMT : IN std_logic_vector (M -1 downto 0) ;
--- Output ---
    Y : OUT std_logic_vector (15 downto 0)
) ;
end Component ;

-- srl component declaration
Component srlN is
GENERIC ( N : INTEGER := 32; -- bit width
          M : INTEGER := 5) ; --shift bits
PORT (
--- Input ---
    A : IN std_logic_vector (15 downto 0) ;
    SHIFT_AMT : IN std_logic_vector (M -1 downto 0) ;
--- Output ---
    Y : OUT std_logic_vector (15 downto 0)
) ;
end Component ;

-- sra component declaration
Component sraN is
GENERIC ( N : INTEGER := 32; -- bit width
          M : INTEGER := 5 ) ; --shift bits
PORT (
--- Input ---
    A : IN std_logic_vector (15 downto 0) ;
    SHIFT_AMT : IN std_logic_vector (M -1 downto 0) ;
--- Output ---    
    Y : OUT std_logic_vector (15 downto 0)
) ;
end Component ;

-- RippleCarryFullAdder component declaration
Component RippleCarryFullAdder is
PORT (
--- Input ---
    A : IN std_logic_vector (15 downto 0);
    B : IN std_logic_vector (15 downto 0);
    OP : IN std_logic;
--- Output ---
    Sum : OUT std_logic_vector (15 downto 0)
) ;
end Component ;

-- RippleCarryFullAdder component declaration
Component Multiplier is
PORT (
---- Inputs ------
		A    : in std_logic_vector((N/2)-1 downto 0);
		B    : in std_logic_vector((N/2)-1 downto 0);
---- Outputs ------
        Product    : out std_logic_vector(15 downto 0)
) ;
end Component ;

-- this is done so you can see code with and without components .
signal or_result  : std_logic_vector (15 downto 0) ;
signal and_result : std_logic_vector (15 downto 0) ;
signal sll_result : std_logic_vector (15 downto 0) ;
signal xor_result : std_logic_vector (15 downto 0) ;
signal srl_result : std_logic_vector (15 downto 0) ;
signal sra_result : std_logic_vector (15 downto 0) ;
signal rcfa_result: std_logic_vector (15 downto 0) ;
signal mul_result : std_logic_vector (15 downto 0) ;
begin
-- Instantiate the or , using component 
    or_comp : orN
        generic map ( N => N )
        port map ( A => in1 , B => in2, Y => or_result ) ;
        
-- Instantiate the and , using component 
    and_comp : andN
        generic map ( N => N )
        port map ( A => in1 , B => in2, Y => and_result ) ;       
-- Instantiate the xor , using component 
    xor_comp : xorN
        generic map ( N => N )
        port map ( A => in1 , B => in2, Y => xor_result ) ; 

-- Instantiate the logical left shift , using component 
    sll_comp : sllN
        generic map ( N => N, M => M )
        port map ( A => in1, SHIFT_AMT => in2(M-1 downto 0), Y => sll_result ) ; 

-- Instantiate the logical right shift , using component 
    srl_comp : srlN
        generic map ( N => N, M => M )
        port map ( A => in1 , SHIFT_AMT => in2(M-1 downto 0), Y => srl_result ) ;
-- Instantiate the arithmetic right shift , using component 
    sra_comp : sraN
        generic map ( N => N, M => M )
        port map ( A => in1 , SHIFT_AMT => in2(M-1 downto 0), Y => sra_result ) ; 
-- Instantiate the arithmetic right shift , using component 
    RippleCarryFullAdder_comp : RippleCarryFullAdder 
        port map ( A => in1 , B => in2,OP => control(0), Sum => rcfa_result ) ; 
-- Instantiate the arithmetic right shift , using component 
    Multiplier_comp : Multiplier 
        port map ( A => in1((N/2)-1 downto 0) , B => in2((N/2)-1 downto 0), Product => mul_result ) ; 
          
-- Use OP to control which operation to show / perform
process(control, in1, in2, or_result, and_result, xor_result, sll_result, srl_result, sra_result, rcfa_result, mul_result)
begin
	case control is
		when "1000" => out1 <= or_result;  --OR
		when "1010" => out1 <= and_result; --AND
		when "1011" => out1 <= xor_result; --XOR
		when "1100" => out1 <= sll_result; --SLL
		when "1101" => out1 <= srl_result; --SRL
		when "1110" => out1 <= sra_result; --SRA
		when "0100" | "0101" => out1 <= rcfa_result;
		when "0110" => out1 <= mul_result;
		
		when others => out1 <= (others => '0'); --No selection
	end case;
end process;                    
end structural ;
