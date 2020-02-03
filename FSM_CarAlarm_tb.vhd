-- Engineer:	Stavros Kalapothas
-- Create Date:	17/01/2020
-- Project Name: ask3.2

library ieee;
use ieee.std_logic_1164.all;

entity fsm_car_alarm_tb is
end fsm_car_alarm_tb;

architecture rtl_fsm_car_alarm_tb of fsm_car_alarm_tb is
component fsm_car_alarm is
	port (clk, rst, remote, sensors: in std_logic;
		siren: out std_logic
		);
end component;

signal clk: std_logic :='1';
signal rst: std_logic :='0';
signal rmt: std_logic :='0';
signal sns: std_logic :='0';
signal sir: std_logic :='0';
constant clk_period : time := 40 ns;

begin

cnt_inst: fsm_car_alarm
      port map (                                                            
                clk, rst, rmt, sns, sir
	);

clk_gen: process is
begin
        clk <= '1';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '0';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
end process clk_gen;

trig: process is
begin
         rst<= '1';
         rmt<= '0';
         sns<= '0';
         wait for clk_period*1;
         rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*1;
	 rst<= '0';	 
         rmt<= '1';
         sns<= '1';
         wait for clk_period*2;
	 rst<= '0';	 
         rmt<= '0';
         sns<= '0';
         wait for clk_period*2;
         rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*2;
	 rst<= '0';
	 rmt<= '1';
         sns<= '0';
         wait for clk_period*2;
         rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*2;
         rst<= '0';
	 rmt<= '0';
         sns<= '1';
         wait for clk_period*4;
	 rst<= '0';
	 rmt<= '1';
         sns<= '0';
         wait for clk_period*2;
         rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*2;
	 rst<= '0';
	 rmt<= '1';
         sns<= '0';
         wait for clk_period*2;
         rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*4;
	 rst<= '0';
         rmt<= '0';
         sns<= '1';
         wait for clk_period*5;
         rst<= '0';
	 rmt<= '0';
         sns<= '1';
         wait for clk_period*4;
	 rst<= '0';
	 rmt<= '1';
         sns<= '0';
         wait for clk_period*2;
         rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*2;
	 rst<= '0';
         rmt<= '0';
         sns<= '1';
         wait for clk_period*5;
         rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*6;
         rst<= '0';
	 rmt<= '1';
         sns<= '0';
         wait for clk_period*2;
         rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*4;
         rst<= '0';
	 rmt<= '0';
         sns<= '1';
         wait for clk_period*5;
	 rst<= '0';
	 rmt<= '1';
         sns<= '0';
         wait for clk_period*2;
         rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*2;
	 rst<= '0';
	 rmt<= '0';
         sns<= '1';
         wait for clk_period*5;
	 rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*6;
	 rst<= '0';
	 rmt<= '1';
         sns<= '0';
         wait for clk_period*2;
	 rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*4;
	 rst<= '0';
 	 rmt<= '0';
         sns<= '1';
         wait for clk_period*4;
	 rst<= '0';
	 rmt<= '0';
         sns<= '0';
         wait for clk_period*4;
	 wait;
end process trig;

end rtl_fsm_car_alarm_tb;