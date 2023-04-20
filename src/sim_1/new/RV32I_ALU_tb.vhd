----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2023 08:53:45 PM
-- Design Name: 
-- Module Name: RV32I_ALU_tb - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RV32I_ALU_tb is
--  Port ( );
end RV32I_ALU_tb;

architecture Behavioral of RV32I_ALU_tb is

    COMPONENT RV32I_ALU IS
    PORT(
        A_32, B_32: in STD_LOGIC_VECTOR(31 downto 0);
        ALU_Op: in STD_LOGIC_VECTOR (3 downto 0);
        ALU_Out_32: out STD_LOGIC_VECTOR (31 downto 0);
        O_flow: out STD_LOGIC
    );
    END COMPONENT;
    
    --Inputs
    signal A : STD_LOGIC_VECTOR (31 downto 0);
    signal B : STD_LOGIC_VECTOR (31 downto 0);
    signal Op : STD_LOGIC_VECTOR (3 downto 0);
    
    --Outputs
    signal ALU_Out : STD_LOGIC_VECTOR (31 downto 0);
    signal Overflow : STD_LOGIC;
    
    signal i: integer;
    
begin

    UUT : RV32I_ALU PORT MAP(
          A_32=> A,
          B_32=> B,
          ALU_Op => Op,
          ALU_Out_32 => ALU_Out,
          O_flow => Overflow
          );
          
    -- Stimulus
    stim_proc : process
    begin
        A <= x"02468ACE";
        B <= x"013579BD";
        
        Op <= x"0";
        wait for 100 ns;
        
        Op <= x"1";
        wait for 100 ns;
        
        Op <= x"2";
        wait for 100 ns;
        
        Op <= x"4";
        wait for 100 ns;
        
        Op <= x"6";
        wait for 100 ns;
        
        Op <= x"8";
        wait for 100 ns;
        
        Op <= x"A";
        wait for 100 ns;
        
        Op <= x"B";
        wait for 100 ns;
        
        Op <= x"C";
        wait for 100 ns;
        
        Op <= x"E";
        wait for 100 ns;
        
    end process;
    

end Behavioral;
