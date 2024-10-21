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
    -- F Register
    constant Z_FLAG : integer := 7;
    constant N_FLAG : integer := 6;
    constant H_FLAG : integer := 5;
    constant C_FLAG : integer := 4;
    -- ALU Instructions
    constant ALU_ADD : std_logic_vector := "00000";
    constant ALU_SUB : std_logic_vector := "00001";
    constant ALU_OR  : std_logic_vector := "00010";
    constant ALU_XOR : std_logic_vector := "00011";
    constant ALU_AND : std_logic_vector := "00100";
    constant ALU_RR  : std_logic_vector := "00101";
    constant ALU_RL  : std_logic_vector := "00110";
    constant ALU_RRC : std_logic_vector := "00111";
    constant ALU_RLC : std_logic_vector := "01000";
    constant ALU_SLA : std_logic_vector := "01001";
    constant ALU_SRA : std_logic_vector := "01010";
    constant ALU_SRL : std_logic_vector := "01011";
    constant ALU_SWAP: std_logic_vector := "01100";
end;

