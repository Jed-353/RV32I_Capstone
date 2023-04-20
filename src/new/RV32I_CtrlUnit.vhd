----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2023 07:48:32 PM
-- Design Name: 
-- Module Name: RV32I_CtrlUnit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RV32I_CtrlUnit is
    Port ( Funct7 : in STD_LOGIC;
           Funct3 : in STD_LOGIC_VECTOR (2 downto 0);
           Opcode : in STD_LOGIC_VECTOR (6 downto 0);
           PC_Sel : out STD_LOGIC;
           Imm_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           --Branch : out STD_LOGIC;
           A_Sel : out STD_LOGIC;
           B_Sel : out STD_LOGIC;
           ALU_Op : out STD_LOGIC_VECTOR (3 downto 0);
           Mem_R : out STD_LOGIC;
           Mem_W : out STD_LOGIC;
           Reg_W : out STD_LOGIC;
           WB_Sel : out STD_LOGIC_VECTOR (1 downto 0));
end RV32I_CtrlUnit;

architecture Behavioral of RV32I_CtrlUnit is

begin

NonALU_proc : process (Opcode)
    begin
        case (Opcode) is
        when "0110011"|"0111011" => --R
            PC_Sel <= '0';
            A_Sel <= '0';
            B_Sel <= '0';
            Mem_R <= '1';
            Mem_W <= '0';
            Reg_W <= '1';
            WB_Sel <= "00";
            ALU_Op <= Funct3 & Funct7;
            
        when "0010011" =>           --Immediate variations to R
            PC_Sel <= '0';
            Imm_Sel <= "000";
            A_Sel <= '0';
            B_Sel <= '1';
            Mem_R <= '1';
            Mem_W <= '0';
            Reg_W <= '1';
            WB_Sel <= "00";
            ALU_Op <= Funct3 & Funct7;
            
        when "0000011" =>           --Load
            PC_Sel <= '0';
            Imm_Sel <= "000";
            A_Sel <= '0';
            B_Sel <= '1';
            Mem_R <= '1';
            Mem_W <= '0';
            Reg_W <= '1';
            WB_Sel <= "01";
            ALU_Op <= x"0";
        
        when "0100011" =>           --Store
            PC_Sel <= '0';
            Imm_Sel <= "001";
            A_Sel <= '0';
            B_Sel <= '1';
            Mem_R <= '0';
            Mem_W <= '1';
            Reg_W <= '0';
            ALU_Op <= x"0";
            
        when "1100011" =>           --SB - Conditional branching
            PC_Sel <= '1';
            Imm_Sel <= "010";
            A_Sel <= '1';
            B_Sel <= '1';
            Mem_R <= '1';
            Mem_W <= '0';
            Reg_W <= '0';
            ALU_Op <= x"0";
            
        when "0010111" =>           --U
            PC_Sel <= '0';
            Imm_Sel <= "100";
            A_Sel <= '1';
            B_Sel <= '1';
            Mem_R <= '1';
            Mem_W <= '0';
            Reg_W <= '1';
            WB_Sel <= "00";
            ALU_Op <= x"0";
        
        when "1101111" =>           --UJ
            PC_Sel <= '0';
            Imm_Sel <= "011";
            A_Sel <= '1';
            B_Sel <= '1';
            Mem_R <= '1';
            Mem_W <= '0';
            Reg_W <= '1';
            WB_Sel <= "10";
            ALU_Op <= x"0";
            
        when "0110111" =>           --LUI
            PC_Sel <= '0';
            Imm_Sel <= "100";
            A_Sel <= '0';
            B_Sel <= '1';
            Mem_R <= '1';
            Mem_W <= '0';
            Reg_W <= '1';
            WB_Sel <= "00";
            ALU_Op <= x"0";
            
        when "1100111" =>           --JALR
            PC_Sel <= '1';
            Imm_Sel <= "000";
            A_Sel <= '0';
            B_Sel <= '1';
            Mem_R <= '1';
            Mem_W <= '0';
            Reg_W <= '1';
            WB_Sel <= "10";
            ALU_Op <= x"0";
            
        when others =>
            PC_Sel <= '0';
            A_Sel <= '0';
            Mem_R <= '1';
            Reg_W <= '1';
            WB_Sel <= "00";
            ALU_Op <= x"0";
            
        end case;
        
    end process;
    
end Behavioral;
