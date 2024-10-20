-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/17/24 >
-- Design Name : rrc_GB
-- Module Name : rrc_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit Rotate Right Carry unit
-- ----------------------------------------------------

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity rrc_GB is
    port(
    --- Input ---    
        A   : in std_logic_vector (7 downto 0);
        Cin : in std_logic;
    --- Output ---    
        Y    : out std_logic_vector (7 downto 0);
        Cout : out std_logic
    );
end rrc_GB ;

architecture dataflow of rrc_GB is
begin
    Y <= Cin & A(7 downto 1);
    Cout <= A(0);
end dataflow ;
