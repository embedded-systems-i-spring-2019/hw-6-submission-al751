----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2019 06:01:41 PM
-- Design Name: 
-- Module Name: Problem11_4 - problem4
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

entity Problem11_4 is
Port (clk, init, X1, X2: in std_logic;
      Z1, Z2: out std_logic);
end Problem11_4;

architecture problem4 of Problem11_4 is
    type state is (A, B, C);
    signal PS, NS: state;
begin

    synch_proc: process(clk)
    begin
        if(rising_edge(clk)) then
            if(init = '1') then
                NS <= A;
            end if;
            PS <= NS;
        end if;
    end process synch_proc;
    
    comb_proc: process(X1, X2)
    begin
        Z1 <= '0'; Z2 <= '0';
        case PS is
            when A =>
            Z1 <= '0';
                if(X1 = '1') then
                    NS <= B; Z2 <= '1';
                else
                    NS <= C; Z2 <= '0';
                end if;
            when B => 
            Z1 <= '1';
                if(X2 = '1') then
                    NS <= A; Z2 <= '0';
                else
                    NS <= C; Z2 <= '1';
                end if;
            when C => 
            Z1 <= '1';
                if(X1 = '1') then
                    NS <= B; Z2 <= '1';
                else
                    NS <= A; Z2 <= '1';
                end if;
            end case;
        end process comb_proc;
end problem4;
