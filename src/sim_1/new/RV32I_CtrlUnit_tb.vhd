----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2023 01:45:33 AM
-- Design Name: 
-- Module Name: RV32I_CtrlUnit_tb - Behavioral
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

entity RV32I_CtrlUnit_tb is
--  Port ( );
end RV32I_CtrlUnit_tb;

architecture Behavioral of RV32I_CtrlUnit_tb is
    component RV32I_CtrlUnit is
        Port ( Funct7 : in STD_LOGIC;
               Funct3 : in STD_LOGIC_VECTOR (2 downto 0);
               Opcode : in STD_LOGIC_VECTOR (6 downto 0);
               PC_Sel : out STD_LOGIC;
               Imm_Sel : out STD_LOGIC_VECTOR (2 downto 0);
               A_Sel : out STD_LOGIC;
               B_Sel : out STD_LOGIC;
               ALU_Op : out STD_LOGIC_VECTOR (3 downto 0);
               Mem_R : out STD_LOGIC;
               Mem_W : out STD_LOGIC;
               Reg_W : out STD_LOGIC;
               WB_Sel : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    --Input Signals:
    signal F7 : STD_LOGIC;
    signal F3 : STD_LOGIC_VECTOR (2 downto 0);
    signal Op : STD_LOGIC_VECTOR (6 downto 0);
    
    --Output Signals
    signal PC_S : STD_LOGIC;
    signal Im_S : STD_LOGIC_VECTOR (2 downto 0);
    signal A_S : STD_LOGIC;
    signal B_S : STD_LOGIC;
    signal Op_Out : STD_LOGIC_VECTOR (3 downto 0);
    signal M_R : STD_LOGIC;
    signal M_W : STD_LOGIC;
    signal R_W : STD_LOGIC;
    signal WB_S : STD_LOGIC_VECTOR (1 downto 0);
    
begin

    UUT: RV32I_CtrlUnit PORT MAP(
         Funct7 => F7,
         Funct3 => F3,
         Opcode => Op,
         
         PC_Sel => PC_S,
         Imm_Sel => Im_S,
         A_Sel => A_S,
         B_Sel => B_S,
         ALU_Op => Op_Out,
         Mem_R => M_R,
         Mem_W => M_W,
         Reg_W => R_W,
         WB_Sel => WB_S        
         );
    stim_proc: process
    begin
        --R-Types
        --add
        Op <= "0110011";
        F3 <= "000";
        F7 <= '0';
        wait for 100 ns;
        
        --sub
        F7 <= '1';
        wait for 100 ns;
        
        --sll
        F3 <= "001";
        F7 <= '0';
        wait for 100 ns;
        
       --slt
        F3 <= "010";
        wait for 100 ns;
        
        --xor
        F3 <= "100";
        wait for 100 ns;
        
        -- new section
        wait for 200 ns;
        
        -- I-type
        --addi
        Op <= "0010011";
        F3 <= "000";
        F7 <= '0';
        wait for 100 ns;
        
        --subi
        F7 <= '1';
        wait for 100 ns;
        
        --slli
        F3 <= "001";
        F7 <= '0';
        wait for 100 ns;
        
       --slti
        F3 <= "010";
        wait for 100 ns;
        
        --xori
        F3 <= "100";
        wait for 100 ns;
        
        -- Load
        wait for 200 ns;
        --Load Word (lw)
        Op <= "0000011";
        F3 <= "010";
        F7 <= '0';
        wait for 100 ns;
        
        --Store
        wait for 200 ns;
        --sw 
        Op <= "0100011";
              
        --Branch
        wait for 200 ns;
        --beq 
        Op <= "1100011";
        F3 <= "000";
        
        --Jump and Link Register
        wait for 200 ns;
        --jalr 
        Op <= "1100111";
        
        --Jump and Link
        wait for 200 ns;
        --sw 
        Op <= "1101111";
        
        --AUIPC,U
        wait for 200 ns;
        --sw 
        Op <= "0110111";
        
    
    end process;

end Behavioral;
