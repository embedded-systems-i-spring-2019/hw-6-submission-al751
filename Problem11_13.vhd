----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2019 06:31:35 PM
-- Design Name: 
-- Module Name: Problem11_13 - problem13
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

entity Problem11_13 is
Port (clk, X1, X2: in std_logic;
      CS, RD: out std_logic);
end Problem11_13;

architecture problem13 of Problem11_13 is
    type state is (ST0, ST1, ST2);
    signal PS, NS: state;
    
begin
    synch_proc: process(clk)
    begin
        if(rising_edge(clk)) then 
            PS <= NS;
        end if;
    end process synch_proc;
    
    comb_proc: process(X1, X2)
    begin
    CS <= '0'; RD <= '0';
        case PS is
        when ST0 => 
            if(X1 = '1') then
                NS <= ST2; CS <= '1'; RD <= '0';
            else
                NS <= ST1; CS <= '0'; RD <= '1';
            end if;
        when ST1 => 
            NS <= ST2; CS <= '1'; RD <= '1';
        when ST2 => 
            if(X2 = '1') then
                NS <= ST2; CS <= '0'; RD <= '1';
            else
                NS <= ST0; CS <= '0'; RD <= '0';
            end if;
        end case;
    end process comb_proc;
end problem13;
