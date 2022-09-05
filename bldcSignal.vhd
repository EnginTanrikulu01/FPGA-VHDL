library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk200Hz is
    Port (
                clk_in : in  STD_LOGIC;
                reset  : in  STD_LOGIC;  
                clk_bldc : out std_logic_vector(2 downto 0)
        
    );
end clk200Hz;

architecture Behavioral of clk200Hz is
                
                signal s_data   : std_logic_vector(2 downto 0) ;
                signal counter : integer range 0 to 3_000_010 := 0;
begin
    frequency_divider: process (reset, clk_in) begin
                if (reset = '1') then
                    s_data <= "000";
                    counter <= 0;          
                elsif rising_edge(clk_in) then
                
                            if(counter <= 3_000_000) then
                                counter <= counter + 1;  
                            elsif(counter > 3_000_000) then
                                counter <=0;
                            end if;    
                             
                            if(counter < 1_000_000 and counter >= 0) then
                                s_data <= "100";
                            
                            elsif(counter < 2_000_000 and counter >= 1_000_000) then               
                                s_data <= "010";
                            
                            elsif(counter < 3_000_000 and counter >= 2_000_000) then                         
                                s_data <= "001";
                            end if;
                               
              end if;
    end process; 
    clk_bldc <= s_data;
end Behavioral;
