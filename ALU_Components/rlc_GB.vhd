-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/17/24 >
-- Design Name : rlc_GB
-- Module Name : rlc_GB - dataflow
-- Project Name : <GameBoy-VHDL>
--
-- Description : 8-bit Rotate Left Carry unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity rlc_GB is
    port (
    --- Input ---    
        A   : in std_logic_vector (7 downto 0);
        Cin : in std_logic;
    --- Output ---    
        Y   : out std_logic_vector (7 downto 0);
        Cout: out std_logic
    );
end rlc_GB ;

architecture dataflow of rlc_GB is
begin
    Y <= A(6 downto 0) & Cin;
    Cout <= A(7);
end dataflow ;
