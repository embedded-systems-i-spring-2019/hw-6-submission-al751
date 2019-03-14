----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2019 06:18:12 PM
-- Design Name: 
-- Module Name: Problem11_6 - problem6
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

entity Problem11_6 is
Port (clk, x: in std_logic;
      z1, z2: out std_logic);
end Problem11_6;

architecture problem6 of Problem11_6 is
    type state is (ST0, ST1, ST2, ST3);
    signal NS, PS: state;
    
begin
    
    synch_proc: process(clk)
    begin
        if(rising_edge(clk)) then
            PS <= NS;
        end if;
    end process synch_proc;
    
    comb_proc: process(X)
    begin
    Z1 <= '0'; Z2 <= '0';
        case PS is
        when ST0 =>
        Z1 <= '1';
            if(X = '1') then
                Ns <= ST0; Z2 <= '0';
            else
                NS <= ST2; Z2 <= '0';
            end if;
        when ST1 => 
        Z1 <= '0';
            if(X = '1') then
                NS <= ST1; Z2 <= '0';
            else
                NS <= ST3; Z2 <= '0';
            end if;
        when ST2 => 
        Z1 <= '1';
            if(X = '1') then
                NS <= ST0; Z2 <= '0';
            else
                NS <= ST1; Z2 <= '0';
            end if;
        when ST3 =>
        Z2 <= '0';
            if(X = '1') then
                NS <= ST1; Z2 <= '0';
            else
                NS <= ST0; Z2 <= '1';
            end if;
        end case;
    end process comb_proc;
end problem6;
