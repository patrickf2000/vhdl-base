library ieee;
use ieee.std_logic_1164.all;

entity and_tb is
end and_tb;

architecture behavior of and_tb is
    -- Declare our component
    component AND2
        port(A, B : in std_logic; F : out std_logic);
    end component;
    
    -- Bind to the component
    for AND2_0: AND2 use entity work.AND2;
    signal A, B, F : std_logic;
begin
    -- Initialize component
    AND2_0: AND2 port map(A => A, B => B, F => F);
    
    process
        type pattern_type is record
            A, B : std_logic;
            F : std_logic;
        end record;
        
        -- Put your patterns here
        type pattern_array is array (natural range <>) of pattern_type;
        constant patterns: pattern_array := (
            ( '0', '0', '0' ),
            ( '0', '1', '0' ),
            ( '1', '0', '0' ),
            ( '1', '1', '1' )
            );
    begin
        
        -- Verify each pattern
        for i in patterns'range loop
            A <= patterns(i).A;
            B <= patterns(i).B;
            wait for 1 ns;
            
            assert F = patterns(i).F
                report "Test failed." severity error;
            assert false report "" severity note;
        end loop;
        
        assert false report "" severity note;
        assert false report "Test completed." severity note;
        assert false report "" severity note;
        wait;
        
    end process;
end architecture;
