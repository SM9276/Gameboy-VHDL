-- ----------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( <SM9276@RIT.EDU>)
--
-- Create Date : <10/20/24 >
-- Design Name : globals
-- Module Name : globals - package ( library )
-- Project Name : < GameBoy-VHDL >
--
-- Description :
-- ----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
package globals is
    constant Z_FLAG : integer := 7;
    constant N_FLAG : integer := 6;
    constant H_FLAG : integer := 5;
    constant C_FLAG : integer := 4;
end;

