-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/13/24 >
-- Design Name : ALU_GB
-- Module Name : ALU_GB - structural
-- Project Name : <Gameboy-VHDL>
--
-- Description : 8-bit Arithmetic Logic Unit for the GameBoy
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;

entity ALU_GB is
PORT (
--- Input ---
    in1:     IN std_logic_vector (7 downto 0) ;
    in2:     IN std_logic_vector (7 downto 0) ;
    control: IN std_logic_vector(4 downto 0);
    inflags: IN std_logic_vector(7 downto 0);
    
--- Output ---
    out1 :       OUT std_logic_vector (7 downto 0);
    outflags:    OUT std_logic_vector (7 downto 0)
) ;
end ALU_GB;

architecture structural of ALU_GB is

-- or component declaration
Component or_GB is
PORT (
--- Input ---
    A : IN std_logic_vector (7 downto 0) ;
    B : IN std_logic_vector (7 downto 0) ;
--- Output ---
    Y : OUT std_logic_vector (7 downto 0)
) ;
end Component ;

-- and component declaration
Component and_GB is
PORT (
--- Input ---
    A : IN std_logic_vector (7 downto 0) ;
    B : IN std_logic_vector (7 downto 0) ;
--- Output ---
    Y : OUT std_logic_vector (7 downto 0)
) ;
end Component ;

-- xor component declaration
Component xor_GB is
PORT (
--- Input ---
    A : IN  std_logic_vector (7 downto 0) ;
    B : IN  std_logic_vector (7 downto 0) ;
--- Output ---
    Y : OUT std_logic_vector (7 downto 0)
) ;
end Component ;

-- srl component declaration
Component srl_GB is
PORT (
--- Input ---
    A : IN std_logic_vector (7 downto 0) ;
--- Output ---
    Y : OUT std_logic_vector (7 downto 0)
) ;
end Component ;

-- sra component declaration
Component sra_GB is
PORT (
--- Input ---
    A : IN std_logic_vector (7 downto 0) ;
--- Output ---    
    Y : OUT std_logic_vector (7 downto 0)
) ;
end Component ;

-- sla component declaration
Component sla_GB is
PORT (
--- Input ---
    A : IN std_logic_vector (7 downto 0) ;
--- Output ---    
    Y : OUT std_logic_vector (7 downto 0)
) ;
end Component ;

-- rl component declaration
Component rl_GB is
PORT (
--- Input ---
    A : IN std_logic_vector (7 downto 0);
--- Output ---
    Y : OUT std_logic_vector (7 downto 0)
) ;
end Component;

-- rr component declaration
Component rr_GB is
PORT (
--- Input ---
    A : IN std_logic_vector (7 downto 0);
--- Output ---
    Y : OUT std_logic_vector (7 downto 0)
) ;
end Component;

-- rlc component declaration
Component rlc_GB is
PORT (
--- Input ---
    A   : IN std_logic_vector (7 downto 0);
    Cin : IN std_logic;
--- Output ---
    Y    : OUT std_logic_vector (7 downto 0);
    Cout : OUT std_logic
) ;
end Component;

-- rrc component declaration
Component rrc_GB is
PORT (
---- Input ---
    A   : IN std_logic_vector (7 downto 0);
    Cin : IN std_logic;
--- Output ---
    Y    : OUT std_logic_vector (7 downto 0);
    Cout : OUT std_logic
) ;
end Component;

-- swap component declaration
Component swap_GB is
PORT (
--- Input ---
    A :    IN std_logic_vector (7 downto 0);
--- Output ---
    Y :     OUT std_logic_vector (7 downto 0)
) ;
end Component;

-- add component declaration
Component add_GB is
PORT (
--- Input ---
    A :  IN std_logic_vector (7 downto 0);
    B :  IN std_logic_vector (7 downto 0);
    Cin: IN std_logic;
--- Output ---
    Y :     OUT std_logic_vector (7 downto 0);
    Cout : OUT std_logic;
    Hout : OUT std_logic 
) ;
end Component;

-- sub component declaration
Component sub_GB is
PORT (
--- Input ---
    A :  IN std_logic_vector (7 downto 0);
    B :  IN std_logic_vector (7 downto 0);
    Cin: IN std_logic;
--- Output ---
    Y :     OUT std_logic_vector (7 downto 0);
    Cout : OUT std_logic;
    Hout : OUT std_logic 
) ;
end Component;



signal or_result  : std_logic_vector (7 downto 0) ;
signal and_result : std_logic_vector (7 downto 0) ;
signal xor_result : std_logic_vector (7 downto 0) ;
signal srl_result : std_logic_vector (7 downto 0) ;
signal sra_result : std_logic_vector (7 downto 0) ;
signal sla_result : std_logic_vector (7 downto 0) ;
signal rr_result  : std_logic_vector (7 downto 0) ;
signal rl_result  : std_logic_vector (7 downto 0) ;
signal rlc_result : std_logic_vector (7 downto 0) ;
signal rrc_result : std_logic_vector (7 downto 0) ;
signal add_result : std_logic_vector (7 downto 0) ;
signal sub_result : std_logic_vector (7 downto 0) ;
signal swap_result: std_logic_vector (7 downto 0) ;
signal rcc_flag_result: std_logic_vector (7 downto 0) ;
signal rcl_flag_result: std_logic_vector (7 downto 0) ;
signal add_flag_result: std_logic_vector (7 downto 0) ; 
signal sub_flag_result: std_logic_vector (7 downto 0) ; 

begin

-- Instantiate the or , using component 
    or_comp : or_GB
        port map ( A => in1 , B => in2, Y => or_result ) ;
-- Instantiate the and , using component 
    and_comp : and_GB
        port map ( A => in1 , B => in2, Y => and_result ) ;       
-- Instantiate the xor , using component 
    xor_comp : xor_GB
        port map ( A => in1 , B => in2, Y => xor_result ) ; 
-- Instantiate the logical right shift , using component 
    srl_comp : srl_GB
        port map ( A => in1 , Y => srl_result ) ;
-- Instantiate the arithmetic right shift , using component 
    sra_comp : sra_GB
        port map ( A => in1 , Y => sra_result ) ;
-- Instantiate the arithmetic left shift , using component 
    sla_comp : sla_GB
        port map ( A => in1 , Y => sla_result ) ;
-- Instantiate the rotate right , using component 
    rr_comp : rr_GB
        port map ( A => in1, Y => rr_result ) ;
--- Instantiate the rotate right , using component 
    rl_comp : rl_GB
        port map ( A => in1, Y => rl_result ) ;
--- Instantiate the rotate right carry , using component 
    rrc_comp : rrc_GB
        port map ( A => in1, Cin => inflags(4), Y => rrc_result, Cout => rcc_flag_result(4));
--- Instantiate the rotate right carry, using component 
    rlc_comp : rlc_GB
        port map ( A => in1, Cin => inflags(4), Y => rrc_result, Cout => rcl_flag_result(4) ) ;
---- Instantiate the swap , using component 
    swap_comp : swap_GB
        port map ( A => in1, Y => swap_result ) ;
---- Instantiate the add , using component 
    add_comp : add_GB
        port map ( A => in1, B=> in2, Cin => inflags(4), Y => add_result, 
                   Cout => add_flag_result(4), Hout => add_flag_result(5));
---- Instantiate the add , using component 
    sub_comp : sub_GB
        port map ( A => in1, B=> in2, Cin => inflags(4), Y => sub_result, 
                   Cout => add_flag_result(4), Hout => sub_flag_result(5));


-- Use OP to control which operation to show / perform
process(control, in1, in2, or_result, and_result, xor_result, srl_result, sra_result)
begin
	case control is
		when "00000" => out1 <= or_result;  
		when "00001" => out1 <= and_result; 
		when "00010" => out1 <= xor_result; 
		when "00011" => out1 <= srl_result; 
		when "00100" => out1 <= sra_result; 
		when others => out1 <= (others => '0');
	end case;
end process;                    
end structural ;
