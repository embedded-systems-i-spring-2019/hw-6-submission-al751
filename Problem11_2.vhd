----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2019 05:39:14 PM
-- Design Name: 
-- Module Name: Problem11_2 - problem2
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

entity Problem11_2 is
Port (X1, X2, clk: in std_logic;
      Y: out std_logic_vector(1 downto 0);
      Z: out std_logic);
end Problem11_2;

architecture problem2 of Problem11_2 is

    type state is (ST0, ST1, ST2);
    signal PS, NS: state;
begin
    synch_proc: process(CLK)
    begin
        if(rising_edge(clk)) then
            PS <= NS;
        end if;
    end process synch_proc;
    
    comb_proc: process(X1, X2)
    begin
    Z <= '0';
    case PS is
        when ST0 =>
            Z <= '0';
            if(X1 = '0') then
                NS <= ST0;
            else
                NS <= ST1;
            end if;
        when ST1 =>
            Z <= '0';
            if(X2 = '1') then
                NS <= ST2;
            else
                NS <= ST0;
                Z <= '1';
            end if;
        when ST2 => 
            Z <= '0';
            if(X2 = '1') then
                NS <= ST2;
            else
                NS <= ST0;
                Z <= '1';
            end if;
        when others => Z <= '0'; NS <= ST0;
    end case;
    end process comb_proc;

    with PS select
        Y <= "10" when ST0,
             "01" when ST1,
             "11" when ST2,
             "10" when others;
end problem2;
