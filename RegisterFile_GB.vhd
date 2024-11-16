------------------------------------------------------
-- Engineer : <Sergio Mercado Nunez > ( < sm9276@rit.edu >)
--
-- Create Date : <10/24/24 >
-- Design Name : RegisterFile_GB
-- Module Name : RegisterFile_GB
-- Project Name : <Gameboy_VHDL>
--
-- Description : RegisterFile hold memory structure of registers.
------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RegisterFile is port ( 
---- Inputs ------
        clk_n	: in std_logic;
        rst     : in std_logic;
		we		: in std_logic;
		Addr1	: in std_logic_vector(3 downto 0); --read address 1
		Addr2	: in std_logic_vector(3 downto 0); --read address 2
		Addr3	: in std_logic_vector(3 downto 0); --write address
		wd		: in std_logic_vector(15 downto 0); --write data, din
---- Outputs ------
		RD1		: out std_logic_vector(15 downto 0); --Read from Addr1
		RD2		: out std_logic_vector(15 downto 0) --Read from Addr2
);
end RegisterFile;

architecture oh_behave of RegisterFile is

type mem_type is array(0 to 7) of std_logic_vector(7 downto 0);   
    signal mem : mem_type := (others => "00000000"); 
begin
    RegFile : process (clk_n) is begin
        if(falling_edge(clk_n)) then 
            if(we = '1') then -- if writing is on 
                mem(to_integer(unsigned(Addr3))) <= wd; -- we can put the data in wd into the addr3
            end if;
        end if;
        end process RegFile;
    RD1 <= mem(to_integer(unsigned(Addr1))); -- read data in addr1/2 asynchronously 
    RD2 <= mem(to_integer(unsigned(Addr2)));
end oh_behave;


