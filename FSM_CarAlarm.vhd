-- Engineer:	Stavros Kalapothas
-- Create Date:	17/01/2020
-- Project Name: ask3.1

library ieee;
use ieee.std_logic_1164.all;

entity fsm_car_alarm is
	port (clk, rst, remote, sensors: in std_logic;
		siren: out std_logic);
end fsm_car_alarm;

--chapter vhdl design of state machines
architecture rtl of fsm_car_alarm is

type alarm_state is (disarmed, armed, intrusion);
attribute enum_encoding: string;
attribute enum_encoding of alarm_state: type is "sequential";
signal prv_state, nxt_state: alarm_state;

begin

-- clk process
process (clk, rst)
begin
	if (rst='1') then
		prv_state <= disarmed;
	elsif (clk'event and clk='1') then
		prv_state <= nxt_state;
	end if;
end process;

-- state process
process (prv_state, remote, sensors)
begin
	case prv_state is
		when disarmed =>
			siren <= '0';
		if (remote='1') then
			nxt_state <= armed;
		else
			nxt_state <= disarmed;
		end if;
		when armed =>
			siren <= '0';
		if (sensors='1') then
			nxt_state <= intrusion;
		elsif (remote='1') then
			nxt_state <= disarmed;
		else
			nxt_state <= armed;
		end if;
		when intrusion =>
			siren <= '1';
		if (remote='1') then
			nxt_state <= disarmed;
		else
			nxt_state <= intrusion;
		end if;
	end case;
end process;
end rtl;