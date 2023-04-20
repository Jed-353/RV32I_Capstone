----------------------------------------------------------------------------------
-- Company: Ashesi University
-- Engineer: Jedidiah Mortey
-- 
-- Create Date: 04/17/2023 07:48:32 PM
-- Design Name: 
-- Module Name: RV32I_ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RV32I_ALU is
        
    Port ( A_32 : in STD_LOGIC_VECTOR (31 downto 0);
           B_32 : in STD_LOGIC_VECTOR (31 downto 0);
           ALU_Op: in STD_LOGIC_VECTOR (3 downto 0);
           ALU_Out_32 : out STD_LOGIC_VECTOR (31 downto 0);
           O_flow : out STD_LOGIC);
           
end RV32I_ALU;

architecture Behavioral of RV32I_ALU is

signal ALU_Result : std_logic_vector (31 downto 0);
signal tmp :  std_logic_vector (32 downto 0);

begin

process(A_32,B_32,ALU_Op)
    begin
        case(ALU_Op) is
        when "0000" => --Add
            ALU_Result <= A_32 + B_32;
        when "0001" => --Sub
            ALU_Result <= A_32 - B_32;
        when "0010" => --sll
            ALU_Result <= std_logic_vector(unsigned(A_32) sll to_integer(unsigned(B_32(4 downto 0))));
        when "0100"|"0110" => --slt|sltu
            if (A_32 < B_32) then
                ALU_Result <= x"00000001";
            else
                ALU_Result <= x"00000000";
            end if;   
        when "1000" => --xor
            ALU_Result <= A_32 xor B_32;
        when "1010" => --srl
            ALU_Result <= std_logic_vector(unsigned(A_32) srl to_integer(unsigned(B_32(4 downto 0))));
        when "1011" => --sra
            ALU_Result <= std_logic_vector(unsigned(A_32) srl to_integer(unsigned(B_32(4 downto 0))));
        when "1100" => --or
            ALU_Result <= A_32 or B_32;
        when "1110" => --and
            ALU_Result <= A_32 and B_32;
        when others =>
            ALU_Result <= A_32 + B_32;
        end case;
            
    end process;
    
    ALU_Out_32 <= ALU_Result;
    tmp <= ('0' & A_32) + ('0' & B_32);
    O_flow <= tmp(32);

end Behavioral;
